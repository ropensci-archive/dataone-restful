

#' Search the dataone repository by fields
#' @param query the search query (character string)
#' @param fuzzy_matching logical indicating whether fuzzy or only exact matches should be returned.  
#' @details The current possible query terms for both search and return fields are given here: https://mule1.dataone.org/ArchitectureDocs-current/design/SearchMetadata.html#attribute-descriptions-and-notes 
#' @import httr
#' @export
d1_search <- function(query, search_field, 
                      return_fields = c("identifier"),
                      fuzzy = TRUE, rows = 100, 
                      format = c("xml", "json", "csv")){

  format <- match.arg(format)
  base <- "https://cn.dataone.org/cn/v1/"
  action <- "query/solr/"
  if(fuzzy_matching) 
    query <- paste0("*", query)
  url <- paste0(base, action, 
                "?q=", search_field, ":", query, 
                "&fl=", paste(return_fields, collapse=","),
                "&rows=", rows, "&wt=", format)
  GET(url)
}




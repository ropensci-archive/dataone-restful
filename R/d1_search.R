

#' Search the dataone repository by fields
#' @param query the search query (character string)
#' @param named string providing optional filters for the search, 
#' e.g. c(author = "Wolkovich", identifier = "doi"), 
#' @param fuzzy logical indicating whether fuzzy or only exact matches should be returned.  
#' @details The current possible query terms for both search and return fields are given here: https://mule1.dataone.org/ArchitectureDocs-current/design/SearchMetadata.html#attribute-descriptions-and-notes 
#' @import httr
#' @export
#' @examples
#' \dontrun{
#'  d1_search("Boettiger", "author")
#' }
d1_search <- function(query, 
                      search_field, 
                      filter = NULL,
                      return_fields = c("identifier"),
                      fuzzy = TRUE, 
                      rows = 100, 
                      format = c("xml", "json", "csv"),
                      node = "https://cn.dataone.org/cn/v1",
                      engine = "solr"){

  format <- match.arg(format)
  action <- paste0("/query/", engine, "/") 
  if(fuzzy){ 
    query <- paste0("*", query)
    filter <- paste0("*", query)
  }
  if(!is.null(filter))
   filter <- paste0("&fq=", paste(names(filter), filter, sep=":", collapse=","))

  url <- paste0(node, 
                action, 
                "?q=", 
                search_field, 
                ":", query, 
                "&fl=", 
                paste(return_fields, collapse=","),
                "&rows=", 
                rows, 
                "&wt=", 
                format)
  GET(url)
}




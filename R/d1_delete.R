#' Archive a data object so that it is removed from indexing
#' @param id the permanent identifier of the object
#' @param repo the authoritativeNode where the data has been archived
#' @param a path to a current dataone certificate
#' @details To generate a valid certificate, visit https://cilogon.org/?skin=DataONE and download a certificate.  (If asked to execute or download `shibCILaunchGSCA.jnlp`, choose execute, which will launch the download.  Otherwise, download this file and run `javaws shibCILaunchGSCA.jnlp` on the command line to launch.  Requires a working Java webscript application.  
#' @aliases d1_archive d1_delete
#' @import httr
#' @export
d1_delete <- function(id, 
                   repo = "https://knb.ecoinformatics.org/knb/d1/mn/v1/"
                   cert = "/tmp/x509up_u1000")
  PUT(paste0(repo, "archive/", id), config=config(sslcert = cert))


# copy tar.gz and zip files from parent to topath folder
# assumes we are at root of the package

## usage example

# prevwd <- getwd()
# # assuming latest package is installed
# ver <- packageVersion("TraMineR")
# setwd("path to root of package")
# package_copy(paste0("TraMineR_",ver), remove=FALSE)
# setwd(prevwd)

package_copy <- function(package, topath="package\\", remove=FALSE, copy.date=TRUE, overwrite=TRUE){
  fromtarfile <- paste0("..\\",package,".tar.gz")
  if (file.exists(fromtarfile)){
    totarfile <- paste0(topath,package,".tar.gz")
    copy1 <- file.copy(from=fromtarfile, to=totarfile, 
                       copy.date=copy.date, overwrite=overwrite)
    if (remove) {
      file.remove(fromtarfile)
    }
  } else {
    message("File ",fromtarfile," does not exists!")
  }
  fromzipfile <- paste0("..\\",package,".zip")
  if (file.exists(fromzipfile)){
    tozipfile <- paste0(topath,package,".zip")
    copy2 <- file.copy(from=fromzipfile, to=tozipfile, 
                       copy.date=copy.date, overwrite=overwrite)
    if (remove){
      file.remove(fromzipfile)
    }
  } else {
    message("File ",fromzipfile," does not exists!")
  }
  return(c(copy1,copy2))
}





#' Read and write mthw raster data
#' 
#' @export
#' @param x stars object
#' @param filename chr then name of the file
#' @return for `write_raster` and `read_raster` a stars object, while 
#'   `get_filename` returns a characater file path
write_raster = function(x, filename){
  if (missing(filename)) filename = "mthw.rds"
  saveRDS(x, filename[1])
  invisible(x)
}

#' @rdname write_raster
#' @export
read_raster = function(filename = mthw_filename(path = system.file(package = "marinethermohalinewaves"))){
  readRDS(filename[1])
}

#' Generate a mthw-centric filename 
#' @export
#' @param region chr the region code
#' @param variable chr a single variable to read
#' @param depth chr a single depth to read
#' @param extension chr, the file extension (with dot)
#' @param path chr, the file path
mthw_filename = function(region = "chfc",
                        variable = "temp", 
                        depth = "sur",
                        extension = c(".rds", ".png", ".pdf", ".jpg")[1],
                        path = c("/mnt/ecocast/corecode/R/marinethermohalinewaves/inst",
                                 system.file(package = "marinethermohalinewaves"))[1]){
  file.path(path,
            sprintf("exdata/%s_%s_%s%s", 
                    region[1],
                    variable[1], 
                    depth[1],
                    extension[1]))
}





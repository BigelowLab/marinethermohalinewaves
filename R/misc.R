#' A slicer that retains class
#' 
#' @export
#' @param x stars object
#' @param date numeric or Date identifying the slabs of time to slice
#' @param the input sliced and with its original class label
slice_date = function(x, date){
  k = class(x)[1]
  if (inherits(date, "Date")){
    dates = stars::st_get_dimension_values(x, "time")
    ix = which(dates %in% date)
    r = dplyr::slice(x, "time", ix) |>
      add_class(k)
  } else {
    r = dplyr::slice(x, "time", date) |>
      add_class(k)
  }
  r
}

#' Add a class membership to any object
#' 
#' This is handy when slicing/filtering stars objects which may drop 
#' any extra class label you hmay have added earlier
#' 
#' @export
#' @param x stars object
#' @param name chr, the class name(s) to add to the object
#' @return the input, `x`, which class augmentation
add_class = function(x, name){
  class(x) <- c(name, class(x))
  x
}

#' Check if a stars object has a time dimension
#' 
#' @export
#' @param x stars object
#' @param names chr, possible time related dimension names
#' @return logical
has_time = function(x, names = c("time", "date", "doy")){
  any(names %in% names(stars::st_dimensions(x)))
}

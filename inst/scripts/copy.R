

src_path = "/mnt/s1/projects/ecocast/corecode/R/mthw"
dst_path = "/mnt/s1/projects/ecocast/corecode/R/marinethermohalinewaves"

ff = list.files(file.path(src_path, "inst/exdata"),
                full.names = TRUE)
file.copy(ff, file.path(dst_path, "inst/exdata"), 
          overwrite = TRUE, 
          recursive = TRUE)

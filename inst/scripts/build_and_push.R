# Run this when you need to reinstall and push to github
#
# > source("path/to/build_and_push.R")
path = "/mnt/s1/projects/ecocast/corecode/R/marinethermohalinewaves"
devtools::document(path)
devtools::install(path, upgrade = FALSE)

orig = setwd(path)

# add
ok = system("git add *")

# commit
date = format(Sys.time(), "%Y-%m-%d %H:%M:%S")
msg = sprintf("git commit -a -m 'auto update %s'", date)
ok = system(msg)

# now push
ok = system("git push origin main")
setwd(orig)


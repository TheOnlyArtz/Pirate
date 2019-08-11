library(devtools)
library(pkgdown)

document()
use_github_links()
use_readme_rmd()
use_news_md()
pkgdown::build_site()

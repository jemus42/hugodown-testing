#! /usr/bin/env Rscript
# Render hugodown and blogdown-posts isolated from each other

# hugodown: just a regular render
file.remove(here::here("content/posts/rmarkdown-hugodown/index.md"))
rmarkdown::render(here::here("content/posts/rmarkdown-hugodown/index.Rmd"))

# blogdown: do not use build_site, would also render hugodown post to HTML
file.remove(here::here("content/posts/rmarkdown-blogdown/index.markdown"))
blogdown:::render_page(here::here("content/posts/rmarkdown-blogdown/index.Rmarkdown"))

# Render site to /public/
hugodown::hugo_build(here::here())

timestamp()

---
title: Blogdown Rmd
author: jemus42
date: '2020-06-06'
slug: blogdown-rmarkdown
categories: ["Rmarkdown", "blogdown", ".Rmarkdown"]
tags: []
description: ''
draft: no
externalLink: ''
series: []
---

| Format                 | Plain Markdown  | Hugodown .Rmd         | Blogdown .Rmarkdown   |
|------------------------|-----------------|-----------------------|-----------------------|
| Live Post              | [here][md-post] | [here][hugodown-post] | [here][blogdown-post] |
| Source HTML            | [here][md-html] | [here][hugodown-html] | [here][blogdown-html] |
| Source .Rmd/.Rmarkdown |                 | [here][hugodown-rmd]  | [here][blogdown-rmd]  |
| Source Markdown        | [here][md-md]   | [here][hugodown-md]   | [here][blogdown-md]   |


[md-post]: /plain-markdown/
[md-md]: https://github.com/jemus42/hugodown-testing/blob/master/content/posts/markdown-goldmark/index.md
[md-html]: https://github.com/jemus42/hugodown-testing/blob/master/public/plain-markdown/index.html

[hugodown-post]: /hugodown-rmarkdown/
[hugodown-html]: https://github.com/jemus42/hugodown-testing/blob/master/public/hugodown-rmarkdown/index.html
[hugodown-rmd]: https://github.com/jemus42/hugodown-testing/blob/master/content/posts/rmarkdown-hugodown/index.Rmd
[hugodown-md]: https://github.com/jemus42/hugodown-testing/blob/master/content/posts/rmarkdown-hugodown/index.md

[blogdown-post]: /blogdown-rmarkdown/
[blogdown-html]: https://github.com/jemus42/hugodown-testing/blob/master/public/blogdown-rmarkdown/index.html
[blogdown-rmd]: https://github.com/jemus42/hugodown-testing/blob/master/content/posts/rmarkdown-blogdown/index.Rmarkdown
[blogdown-md]: https://github.com/jemus42/hugodown-testing/blob/master/content/posts/rmarkdown-blogdown/index.markdown

## Code


```r
knitr::opts_chunk$set(
  fig.path = "plots/", # for leaf bundles to work nicely
  cache = FALSE,
  fig.retina = 2,
  fig.width = 8.5,
  echo = TRUE,
  message = FALSE, warning = FALSE, error = FALSE,
  fig.align = "center",
  out.width = "95%"
)
```

This is a test of {{< pkg "hugodown" >}}.  

### Code with/-out Output


```r
my_packages <- rownames(installed.packages())
n_packages <- length(my_packages)
```

And some filler text between chunks.


```r
n_packages
```

```
## [1] 407
```

```r
tail(tibble::enframe(my_packages))
```

```
## # A tibble: 6 x 2
##    name value    
##   <int> <chr>    
## 1   402 yaml     
## 2   403 yardstick
## 3   404 ymlthis  
## 4   405 zeallot  
## 5   406 zip      
## 6   407 zoo
```


```r
library(tidyverse)
```

```
## ── Attaching packages ──── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.1     ✓ purrr   0.3.4
## ✓ tibble  3.0.1     ✓ dplyr   1.0.0
## ✓ tidyr   1.1.0     ✓ stringr 1.4.0
## ✓ readr   1.3.1     ✓ forcats 0.5.0
```

```
## ── Conflicts ─────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

### Plots


```r
library(ggplot2)

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)
```

<img src="plots/a-plot-1.png" width="95%" style="display: block; margin: auto;" />

### Table


```r
library(dplyr)
sessioninfo::session_info()$packages %>%
  as_tibble() %>%
  filter(package %in% c("hugodown", "dplyr", "ggplot2")) %>% 
  select(package, loadedversion, source) %>%
  knitr::kable(caption = "A neato little table")
```



|package |loadedversion |source         |
|:-------|:-------------|:--------------|
|dplyr   |1.0.0         |CRAN (R 4.0.0) |
|ggplot2 |3.3.1         |CRAN (R 4.0.0) |


## Shortcodes

## Inline

Inline shortcode without tweaks: Hello {{< pkg "hugodown" >}}.

Using `blogdown::shortcode` is not well suited in <!--html_preserve-->{{% pkg "hugodown" %}}<!--/html_preserve-->-land I think, but that's not really hugodown's fault. The html-preserving comments are inserted with newlines, which might explain this. 

## Block-level

Here's a figure shortcode:

{{< figure src="plots/a-plot-1.png" alt="" caption="" >}}

The same shortcode with `blogdown::shortcode`

<!--html_preserve-->{{% figure src="plots/a-plot-1.png" %}}<!--/html_preserve-->

## Footnotes

This is a footnote in `^[inline format]` as used by [pandoc](https://pandoc.org/MANUAL.html#footnotes) but not supported by [Hugo's Goldmark](https://gohugo.io/getting-started/configuration-markup/#goldmark) ^[Hello there].  

Here's a reference-style footnote [^ref].

[^ref]: Something goldmark and pandoc can agree on.


## Math and stuff

(Rmd: Have not applied fixes to make it work yet)

This is text with inline math `\(\sum_{n=1}^{\infty} 2^{-n} = 1\)` and with math blocks:

$$
\sum_{n=1}^{\infty} 2^{-n} = 1
$$

| Heading | Another heading |
| :----:  | :-------------: |
|  text   |      text       |
|  text   |      text       |
|  text   |      text       |


## Session Info

<details>
<summary>Session Info</summary>


```r
sessioninfo::session_info()$packages
```

```
##  package     * version date       lib source        
##  assertthat    0.2.1   2019-03-21 [1] CRAN (R 4.0.0)
##  backports     1.1.7   2020-05-13 [1] CRAN (R 4.0.0)
##  blob          1.2.1   2020-01-20 [1] CRAN (R 4.0.0)
##  blogdown      0.19    2020-05-22 [1] CRAN (R 4.0.0)
##  bookdown      0.19    2020-05-15 [1] CRAN (R 4.0.0)
##  broom         0.5.6   2020-04-20 [1] CRAN (R 4.0.0)
##  cellranger    1.1.0   2016-07-27 [1] CRAN (R 4.0.0)
##  cli           2.0.2   2020-02-28 [1] CRAN (R 4.0.0)
##  colorspace    1.4-1   2019-03-18 [1] CRAN (R 4.0.0)
##  crayon        1.3.4   2017-09-16 [1] CRAN (R 4.0.0)
##  DBI           1.1.0   2019-12-15 [1] CRAN (R 4.0.0)
##  dbplyr        1.4.4   2020-05-27 [1] CRAN (R 4.0.0)
##  digest        0.6.25  2020-02-23 [1] CRAN (R 4.0.0)
##  dplyr       * 1.0.0   2020-05-29 [1] CRAN (R 4.0.0)
##  ellipsis      0.3.1   2020-05-15 [1] CRAN (R 4.0.0)
##  evaluate      0.14    2019-05-28 [1] CRAN (R 4.0.0)
##  fansi         0.4.1   2020-01-08 [1] CRAN (R 4.0.0)
##  farver        2.0.3   2020-01-16 [1] CRAN (R 4.0.0)
##  forcats     * 0.5.0   2020-03-01 [1] CRAN (R 4.0.0)
##  fs            1.4.1   2020-04-04 [1] CRAN (R 4.0.0)
##  generics      0.0.2   2018-11-29 [1] CRAN (R 4.0.0)
##  ggplot2     * 3.3.1   2020-05-28 [1] CRAN (R 4.0.0)
##  glue          1.4.1   2020-05-13 [1] CRAN (R 4.0.0)
##  gtable        0.3.0   2019-03-25 [1] CRAN (R 4.0.0)
##  haven         2.3.1   2020-06-01 [1] CRAN (R 4.0.0)
##  highr         0.8     2019-03-20 [1] CRAN (R 4.0.0)
##  hms           0.5.3   2020-01-08 [1] CRAN (R 4.0.0)
##  htmltools     0.4.0   2019-10-04 [1] CRAN (R 4.0.0)
##  httr          1.4.1   2019-08-05 [1] CRAN (R 4.0.0)
##  jsonlite      1.6.1   2020-02-02 [1] CRAN (R 4.0.0)
##  knitr         1.28    2020-02-06 [1] CRAN (R 4.0.0)
##  labeling      0.3     2014-08-23 [1] CRAN (R 4.0.0)
##  lattice       0.20-41 2020-04-02 [1] CRAN (R 4.0.0)
##  lifecycle     0.2.0   2020-03-06 [1] CRAN (R 4.0.0)
##  lubridate     1.7.9   2020-06-08 [1] CRAN (R 4.0.0)
##  magrittr      1.5     2014-11-22 [1] CRAN (R 4.0.0)
##  Matrix        1.2-18  2019-11-27 [1] CRAN (R 4.0.0)
##  mgcv          1.8-31  2019-11-09 [1] CRAN (R 4.0.0)
##  modelr        0.1.8   2020-05-19 [1] CRAN (R 4.0.0)
##  munsell       0.5.0   2018-06-12 [1] CRAN (R 4.0.0)
##  nlme          3.1-148 2020-05-24 [1] CRAN (R 4.0.0)
##  pillar        1.4.4   2020-05-05 [1] CRAN (R 4.0.0)
##  pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 4.0.0)
##  purrr       * 0.3.4   2020-04-17 [1] CRAN (R 4.0.0)
##  R6            2.4.1   2019-11-12 [1] CRAN (R 4.0.0)
##  Rcpp          1.0.4.6 2020-04-09 [1] CRAN (R 4.0.0)
##  readr       * 1.3.1   2018-12-21 [1] CRAN (R 4.0.0)
##  readxl        1.3.1   2019-03-13 [1] CRAN (R 4.0.0)
##  reprex        0.3.0   2019-05-16 [1] CRAN (R 4.0.0)
##  reticulate    1.16    2020-05-27 [1] CRAN (R 4.0.0)
##  rlang         0.4.6   2020-05-02 [1] CRAN (R 4.0.0)
##  rmarkdown     2.2     2020-05-31 [1] CRAN (R 4.0.0)
##  rstudioapi    0.11    2020-02-07 [1] CRAN (R 4.0.0)
##  rvest         0.3.5   2019-11-08 [1] CRAN (R 4.0.0)
##  scales        1.1.1   2020-05-11 [1] CRAN (R 4.0.0)
##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 4.0.0)
##  stringi       1.4.6   2020-02-17 [1] CRAN (R 4.0.0)
##  stringr     * 1.4.0   2019-02-10 [1] CRAN (R 4.0.0)
##  tibble      * 3.0.1   2020-04-20 [1] CRAN (R 4.0.0)
##  tidyr       * 1.1.0   2020-05-20 [1] CRAN (R 4.0.0)
##  tidyselect    1.1.0   2020-05-11 [1] CRAN (R 4.0.0)
##  tidyverse   * 1.3.0   2019-11-21 [1] CRAN (R 4.0.0)
##  utf8          1.1.4   2018-05-24 [1] CRAN (R 4.0.0)
##  vctrs         0.3.1   2020-06-05 [1] CRAN (R 4.0.0)
##  withr         2.2.0   2020-04-20 [1] CRAN (R 4.0.0)
##  xfun          0.14    2020-05-20 [1] CRAN (R 4.0.0)
##  xml2          1.3.2   2020-04-23 [1] CRAN (R 4.0.0)
##  yaml          2.2.1   2020-02-01 [1] CRAN (R 4.0.0)
## 
## [1] /Library/Frameworks/R.framework/Versions/4.0/Resources/library
```

</details>

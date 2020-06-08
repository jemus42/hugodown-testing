---
date: '2020-06-06'
title: "Plain Markdown Content"
slug: "plain-markdown"
author: jemus42
categories: ["md", "goldmark"]
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
  cache = TRUE,
  cache.path = "post_cache/", # (for leaf bundles, cache in post directory)
  fig.retina = 2,
  fig.width = 8.5,
  echo = TRUE,
  message = FALSE, warning = FALSE, error = FALSE,
  fig.align = "center",
  out.width = "95%"
)
```

Inline `code`

```r
library(ggplot2)

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)
```

Filler text between chunks

```r
my_packages <- rownames(installed.packages())
n_packages <- length(my_packages)
```

{{< figure src="a-plot-1.png" alt="" caption="A plot" >}}


## Footnotes

This is a footnote in `^[inline format]` as used by [pandoc](https://pandoc.org/MANUAL.html#footnotes) but not supported by [Hugo's Goldmark](https://gohugo.io/getting-started/configuration-markup/#goldmark) ^[Hello there].  

Here's a reference-style footnote [^ref].

[^ref]: Something goldmark and pandoc can agree on.


## Math and stuff

This is text with inline math $\sum_{n=1}^{\infty} 2^{-n} = 1$ and with math blocks:

$$
\sum_{n=1}^{\infty} 2^{-n} = 1
$$

| Heading | Another heading |
| :----:  | :-------------: |
|  text   |      text       |
|  text   |      text       |
|  text   |      text       |

---
date: "2017-01-08"
title: "Plain Markdown Content"
description: "The post demonstrates features of the coder theme."
math: true
series:
  - "Theme"
  - "Hugo"
---

[**Quick link to the RMarkdown post**](/posts/rmarkdown-content/)

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

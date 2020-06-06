---
date: "2017-01-08"
title: "Plain Markdown Content"
description: "The post demonstrates features of the coder theme."
math: true
series:
  - "Theme"
  - "Hugo"
---

[**Quick link to the other post**](/posts/rmarkdown-content/)

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



---

**This is bold text**

__This is bold text__

*This is italic text*

_This is italic text_

~~Deleted text~~

This is text with inline math $\sum_{n=1}^{\infty} 2^{-n} = 1$ and with math blocks:

$$
\sum_{n=1}^{\infty} 2^{-n} = 1
$$

| Heading | Another heading |
| :----:  | :-------------: |
|  text   |      text       |
|  text   |      text       |
|  text   |      text       |

> Block quotes are
> written like so.
>
> They can span multiple paragraphs,
> if you like.

Some text, and some `code` and then a nice plain [link with title](https://github.com/davidhampgonsalves/davidhampgonsalves.com-hugo "title text!").

and then

+ Create a list by starting a line with `+`, `-`, or `*`
+ Sub-lists are made by indenting 2 spaces:
  - Marker character change forces new list start:
    * Ac tristique libero volutpat at
+ Very easy!

vs.

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa

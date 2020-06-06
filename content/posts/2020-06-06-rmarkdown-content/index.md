---
title: Rmarkdown Content
author: jemus42
date: '2020-06-06'
slug: rmarkdown-content
categories: ["Rmarkdown"]
tags: []
description: ''
draft: no
externalLink: ''
series: []
output: hugodown::hugo_document
rmd_hash: 588366d62b61c4f6

---

<pre class='chroma'><span class='k'>knitr</span>::<span class='k'><a href='https://rdrr.io/pkg/knitr/man/opts_chunk.html'>opts_chunk</a></span><span class='o'>$</span><span class='nf'>set</span>(
  fig.path = <span class='s'>"plots/"</span>, <span class='c'># for leaf bundles to work nicely</span>
  cache = <span class='m'>TRUE</span>,
  cache.path = <span class='s'>"post_cache/"</span>, <span class='c'># (for leaf bundles, cache in post directory)</span>
  fig.retina = <span class='m'>2</span>,
  fig.width = <span class='m'>8.5</span>,
  echo = <span class='m'>TRUE</span>,
  message = <span class='m'>FALSE</span>, warning = <span class='m'>FALSE</span>, error = <span class='m'>FALSE</span>,
  fig.align = <span class='s'>"center"</span>,
  out.width = <span class='s'>"95%"</span>
)
</pre>

This is a test of {{&lt; pkg "hugodown" &gt;}}.

R Code
------

### Code with/-out Output

<pre class='chroma'><span class='k'>my_packages</span> <span class='o'>&lt;-</span> <span class='nf'>rownames</span>(<span class='nf'>installed.packages</span>())
<span class='k'>n_packages</span> <span class='o'>&lt;-</span> <span class='nf'>length</span>(<span class='k'>my_packages</span>)
</pre>

And some filler text between chunks.

<pre class='chroma'><span class='k'>n_packages</span>
<span class='c'>#&gt; [1] 407</span>

<span class='nf'>tail</span>(<span class='k'>tibble</span>::<span class='nf'><a href='https://tibble.tidyverse.org/reference/enframe.html'>enframe</a></span>(<span class='k'>my_packages</span>))
<span class='c'>#&gt; # A tibble: 6 x 2</span>
<span class='c'>#&gt;    name value    </span>
<span class='c'>#&gt;   &lt;int&gt; &lt;chr&gt;    </span>
<span class='c'>#&gt; 1   402 xts      </span>
<span class='c'>#&gt; 2   403 yaml     </span>
<span class='c'>#&gt; 3   404 yardstick</span>
<span class='c'>#&gt; 4   405 zeallot  </span>
<span class='c'>#&gt; 5   406 zip      </span>
<span class='c'>#&gt; 6   407 zoo</span>
</pre>

### Plots

-   The entire chunk is contained in `<pre>` tags :(
-   Tabular display of code with line numbers is set in config, but not applied here

<pre class='chroma'><span class='nf'>library</span>(<span class='k'><a href='https://ggplot2.tidyverse.org/reference'>ggplot2</a></span>)

<span class='nf'><a href='https://ggplot2.tidyverse.org/reference/ggplot.html'>ggplot</a></span>(<span class='k'>mtcars</span>, <span class='nf'><a href='https://ggplot2.tidyverse.org/reference/aes.html'>aes</a></span>(x = <span class='k'>wt</span>, y = <span class='k'>mpg</span>, color = <span class='nf'>factor</span>(<span class='k'>cyl</span>))) <span class='o'>+</span>
  <span class='nf'><a href='https://ggplot2.tidyverse.org/reference/geom_point.html'>geom_point</a></span>() <span class='o'>+</span>
  <span class='nf'><a href='https://ggplot2.tidyverse.org/reference/geom_smooth.html'>geom_smooth</a></span>(method = <span class='k'>lm</span>, se = <span class='m'>FALSE</span>)
<img src="plots/a-plot-1.png" width="95%" style="display: block; margin: auto;" /></pre>

Footnotes
---------

This is a footnote in `^[inline format]` as used by [pandoc](https://pandoc.org/MANUAL.html#footnotes) but not supported by [Hugo's Goldmark](https://gohugo.io/getting-started/configuration-markup/#goldmark) [^1].

Here's a reference-style footnote [^2].

Math and stuff
--------------

This is text with inline math $\sum_{n=1}^{\infty} 2^{-n} = 1$ and with math blocks:

$$
\sum_{n=1}^{\infty} 2^{-n} = 1
$$

| Heading | Another heading |
|:-------:|:---------------:|
|   text  |       text      |
|   text  |       text      |
|   text  |       text      |

[^1]: Hello there

[^2]: Something goldmark and pandoc can agree on.


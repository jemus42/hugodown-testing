---
title: RMarkdown Content
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
rmd_hash: 8f4491c252aa5416

---

[**Quick link to plain markdown post**](/posts/2020-06-06-plain/)

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

### Table

<pre class='chroma'><span class='nf'>library</span>(<span class='k'><a href='https://dplyr.tidyverse.org/reference'>dplyr</a></span>)
<span class='k'>sessioninfo</span>::<span class='nf'><a href='https://rdrr.io/pkg/sessioninfo/man/session_info.html'>session_info</a></span>()<span class='o'>$</span><span class='k'>packages</span> <span class='o'>%&gt;%</span>
  <span class='nf'><a href='https://tibble.tidyverse.org/reference/as_tibble.html'>as_tibble</a></span>() <span class='o'>%&gt;%</span>
  <span class='nf'><a href='https://dplyr.tidyverse.org/reference/filter.html'>filter</a></span>(<span class='k'>package</span> <span class='o'>%in%</span> <span class='nf'>c</span>(<span class='s'>"hugodown"</span>, <span class='s'>"dplyr"</span>, <span class='s'>"ggplot2"</span>)) <span class='o'>%&gt;%</span> 
  <span class='nf'><a href='https://dplyr.tidyverse.org/reference/select.html'>select</a></span>(<span class='k'>package</span>, <span class='k'>loadedversion</span>, <span class='k'>source</span>) <span class='o'>%&gt;%</span>
  <span class='k'>knitr</span>::<span class='nf'><a href='https://rdrr.io/pkg/knitr/man/kable.html'>kable</a></span>(caption = <span class='s'>"A neato little table"</span>)


Table: A neato little table

package    loadedversion   source                          
---------  --------------  --------------------------------
dplyr      1.0.0           CRAN (R 4.0.0)                  
ggplot2    3.3.1           CRAN (R 4.0.0)                  
hugodown   0.0.0.9000      Github (r-lib/hugodown@b273edb) 

</pre>

Shortcodes
----------

Inline
------

Inline shortcode without tweaks: Hello {{&lt; pkg "hugodown" &gt;}}.

Using `blogdown::shortcode` is not well suited in <!--html_preserve-->{{% pkg "hugodown" %}}<!--/html_preserve-->-land I think, but that's not really hugodown's fault. The html-preserving comments are inserted with newlines, which might explain this.

Block-level
-----------

Here's a figure shortcode:

{{&lt; figure src="plots/a-plot-1.png" alt=\"\" caption=\"\" &gt;}}

The same shortcode with `blogdown::shortcode`

<!--html_preserve-->

{{% figure src="plots/a-plot-1.png" %}}<!--/html_preserve-->

Footnotes
---------

This is a footnote in `^[inline format]` as used by [pandoc](https://pandoc.org/MANUAL.html#footnotes) but not supported by [Hugo's Goldmark](https://gohugo.io/getting-started/configuration-markup/#goldmark) [^1].

Here's a reference-style footnote [^2].

Math and stuff
--------------

(Rmd: Have not applied fixes to make it work yet)

This is text with inline math $\sum_{n=1}^{\infty} 2^{-n} = 1$ and with math blocks:

$$
\sum_{n=1}^{\infty} 2^{-n} = 1
$$

| Heading | Another heading |
|:-------:|:---------------:|
|   text  |       text      |
|   text  |       text      |
|   text  |       text      |

Session Info
------------

<details>

<summary>Session Info</summary>

<pre class='chroma'><span class='k'>sessioninfo</span>::<span class='nf'><a href='https://rdrr.io/pkg/sessioninfo/man/session_info.html'>session_info</a></span>()<span class='o'>$</span><span class='k'>packages</span>
<span class='c'>#&gt;  package     * version    date       lib source                         </span>
<span class='c'>#&gt;  assertthat    0.2.1      2019-03-21 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  blogdown      0.19       2020-05-22 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  cli           2.0.2      2020-02-28 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  codetools     0.2-16     2018-12-24 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  colorspace    1.4-1      2019-03-18 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  crayon        1.3.4      2017-09-16 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  digest        0.6.25     2020-02-23 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  downlit       0.0.0.9000 2020-06-04 [1] Github (r-lib/downlit@f9eb6b4) </span>
<span class='c'>#&gt;  dplyr       * 1.0.0      2020-05-29 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  ellipsis      0.3.1      2020-05-15 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  evaluate      0.14       2019-05-28 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  fansi         0.4.1      2020-01-08 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  fs            1.4.1      2020-04-04 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  generics      0.0.2      2018-11-29 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  ggplot2     * 3.3.1      2020-05-28 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  glue          1.4.1      2020-05-13 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  gtable        0.3.0      2019-03-25 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  highr         0.8        2019-03-20 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  htmltools     0.4.0      2019-10-04 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  hugodown      0.0.0.9000 2020-06-06 [1] Github (r-lib/hugodown@b273edb)</span>
<span class='c'>#&gt;  jsonlite      1.6.1      2020-02-02 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  knitr         1.28       2020-02-06 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  lattice       0.20-41    2020-04-02 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  lifecycle     0.2.0      2020-03-06 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  magrittr      1.5        2014-11-22 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  Matrix        1.2-18     2019-11-27 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  munsell       0.5.0      2018-06-12 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  pillar        1.4.4      2020-05-05 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  pkgconfig     2.0.3      2019-09-22 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  purrr         0.3.4      2020-04-17 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  R6            2.4.1      2019-11-12 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  Rcpp          1.0.4.6    2020-04-09 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  reticulate    1.16       2020-05-27 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  rlang         0.4.6      2020-05-02 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  rmarkdown     2.2        2020-05-31 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  rstudioapi    0.11       2020-02-07 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  scales        1.1.1      2020-05-11 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  sessioninfo   1.1.1      2018-11-05 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  stringi       1.4.6      2020-02-17 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  stringr       1.4.0      2019-02-10 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  tibble        3.0.1      2020-04-20 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  tidyselect    1.1.0      2020-05-11 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  vctrs         0.3.1      2020-06-05 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  withr         2.2.0      2020-04-20 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  xfun          0.14       2020-05-20 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt;  yaml          2.2.1      2020-02-01 [1] CRAN (R 4.0.0)                 </span>
<span class='c'>#&gt; </span>
<span class='c'>#&gt; [1] /Library/Frameworks/R.framework/Versions/4.0/Resources/library</span>
</pre>
</details>

[^1]: Hello there

[^2]: Something goldmark and pandoc can agree on.


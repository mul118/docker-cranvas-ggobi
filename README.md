# docker-cranvas-ggobi

[![ Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/mul118/docker-cranvas-ggobi)](https://hub.docker.com/r/mul118/docker-cranvas-ggobi)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Docker image containing a browser-accessible Ubuntu installation with included Rstudio Desktop,  [Cranvas](https://github.com/ggobi/cranvas) interactive exploratory data analysis library, and [GGobi](http://ggobi.org/)/[rggobi](https://github.com/ggobi/rggobi) high-dimensional visualization program. Also included is the [idendro](https://github.com/tsieger/idendro) Cranvas extension enabling interactive exploration of heirarchical clustering dendrograms.


## Quick Start

From command line, run

``` bash
docker run -p 6080:80 -v [YOUR LOCAL WORKING DIRECTORY]:/root/work mul118/docker-cranvas-ggobi
```

Then, browse to http://127.0.0.1:6080/ . Open Rstudio and attach the cranvas library. Enjoy!

## Motivation

Interactive statistical graphics are incredibly useful both as an ultra-rapid Interactive Exploartory Data Analysis (IEDA) tool and as a visual 'debugger' for building machine learning models and complex data science products such as search/recommenders, text tagging, custom playlist generators, etc. Unfortunately, it's also somewhat of a [lost art](https://yihui.name/en/2017/12/good-old-ideas/), and while modern interactive graphics alternatives exist via [interactive Shiny plots](https://shiny.rstudio.com/articles/plot-interaction.html), [linked Plotly graphics](https://plotly-r.com/), etc, in my experience none have approached the power, simplicity, and performance provided by Cranvas's old-school (Desktop/Qt) linked IEDA primitives.

Part of the reason for Cranvas's lack of reach is the high barrier to entry - it's [devilishly complex to install](https://github.com/tsieger/idendro/wiki), and virtually impossible on latest MacOS and Windows systems. 

This project aims to lower the barrier to entry by: 

1. Wrapping Cranvas & GGobi in a stable, containerized Linux GUI environment that can be accessed through the browser and run on any OS with Docker installed, and 
2. Handling the complex Cranvas build process, providing an immediately-useful base image that can also be modified/extended.

While Cranvas may not be 'the future', the IEDA ideas behind it definitely are, and it's uniquely useful at present.  It is the my hope that this project can introduce practicing Data Scientists & Analysts to the benefits and potential of IEDA, and play a (small) role in incorporating it into the next generation of DS platforms. 

## Resources


TODO: tutorial resources and sample code.

### Statistical Graphics

- [Mondrian](http://mondrian.theusrus.de/) - Interactive dynamic graphics GUI
  - Tutorial/case studies: [slides](http://www.interactivegraphics.org/Slides.html)
  - Book: [Dynamic Graphics for Interactive Data Exploration](http://mondrian.theusrus.de/)
  
  
### Cranvas 

Afaik, Cranvas does not have a cohesive vignette (a large part of its hipster charm ;)). My recommendation is to go through the Mondrian tips tutorial slides and use the provided companion code reproduce the  tutorial using Cranvas.


- Tutorial:  [slides](http://www.interactivegraphics.org/Slides.html) | [code](https://www.github.com/mul118/docker-cranvas-ggobi/examples/cranvas_intro.R)
- [Cranvas Cheatsheet (WIP)](https://www.github.com/mul118/docker-cranvas-ggobi/examples/cranvas_cheatsheet.Rmd)
- [Package Docs](https://www.rdocumentation.org/packages/cranvas) - see qscatter, qhist, qbar, qparallel for intro examples
- [Cranvas Overview Paper](https://arxiv.org/pdf/1409.7256.pdf) 

# Extensions:

- [Qtime](https://pdfs.semanticscholar.org/f8b5/26fb936fc25ca10c004deb4db667c29f9c5a.pdf): Cranvas Time-series interactions (see p 32)
- *Visualizing Statistical Models*: [paper](http://had.co.nz/stat645/model-vis.pdf) | [Cranvas code](https://www.github.com/mul118/docker-cranvas-ggobi)
- *Idendro*: [Intro & Sample Code](https://github.com/tsieger/idendro) | [Full Vignette](https://github.com/tsieger/idendro/blob/master/inst/doc/idendro.pdf)
- Qtour - high-dimensional tours
- Qmval - missing values


- *GGobi*: [Resources](http://www.ggobi.org/docs) | [Manual](http://www.ggobi.org/docs/manual.pdf) | [Rggobi Intro](http://www.ggobi.org/rggobi/introduction.pdf)


## Build

To build the docker image, navigate to the root laminar directory and type:


``` bash
docker build -t docker-cranvas-ggobi .
```


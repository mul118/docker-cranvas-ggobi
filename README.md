# docker-cranvas-ggobi

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![ Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/mul118/docker-cranvas-ggobi)](https://hub.docker.com/r/mul118/docker-cranvas-ggobi)


Docker image containing a browser-accessible Ubuntu installation with included Rstudio Desktop,  [Cranvas](https://github.com/ggobi/cranvas) interactive exploratory data analysis library, and [GGobi](http://ggobi.org/)/[rggobi](https://github.com/ggobi/rggobi) high-dimensional visualization program. Also included is the [idendro](https://github.com/tsieger/idendro) Cranvas extension enabling interactive exploration of heirarchical clustering dendrograms.


## Quick Start

From command line, run

``` bash
docker run -p 6080:80 -v [YOUR LOCAL WORKING DIRECTORY]:/root/work docker-cranvas-ggobi
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

## Build

To build the docker image, navigate to the root laminar directory and type:


``` bash
docker build -t docker-cranvas-ggobi .
```


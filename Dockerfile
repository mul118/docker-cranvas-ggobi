FROM dorowu/ubuntu-desktop-lxde-vnc


RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    git \
    wget \
    gdebi \
    libqt4-dev \ 
    qt4-qmake \ 
    cmake \ 
    libcurl4-gnutls-dev \
    r-base-dev \
    libssl-dev \
    libssl1.0.0 

RUN wget "http://www.rstudio.org/download/latest/stable/desktop/ubuntu64/rstudio-latest-amd64.deb" \
  && gdebi -n rstudio-*-amd64.deb \
  && rm rstudio-*-amd64.deb

COPY config/desktop.ini /root/.config/RStudio/desktop.ini


# Install tidyverse & cranvas deps
RUN R -e "install.packages(c( \
    'devtools', \
    'config', \
    'tidyverse', \
    'dplyr', \
    'dbplyr', \
    'scales', \
    'tourr', \
    'objectSignals', \
    'objectProperties', \ 
    'plumbr', \
    'SearchTrees'))"

# TODO: incorporate earlier
RUN apt-get install -y --no-install-recommends libxml2-dev 

RUN R -e "install.packages(c( \
  'xml2', \
  'rvest'))"

RUN R -e "devtools::install_github(args = '--no-multiarch', INSTALL_opts = '--no-test-load', c( \
    'hadley/productplots', \
    'hadley/densityvis', \
    'ggobi/qtbase@qt4'))"


RUN apt-get install -y --no-install-recommends libqt4-opengl-dev

RUN R -e "install.packages('remotes')"

ENV R_REMOTES_NO_ERRORS_FROM_WARNINGS=true

RUN R -e "remotes::install_github(args = '--no-multiarch', INSTALL_opts = '--no-test-load', c( \
    'ggobi/qtpaint@5a2a582', \
    'ggobi/cranvas', \
    'tsieger/idendro'))"

     
 


FROM dorowu/ubuntu-desktop-lxde-vnc

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    git \
    wget \
    gdebi \
    libqt4-dev \ 
    libqt4-opengl-dev \
    qt4-qmake \ 
    cmake \ 
    libcurl4-gnutls-dev \
    r-base-dev \
    libssl-dev \
    libssl1.0.0 \
    libxml2-dev \
    libgtk2.0-dev \
    ggobi

RUN wget "http://www.rstudio.org/download/latest/stable/desktop/ubuntu64/rstudio-latest-amd64.deb" \
  && gdebi -n rstudio-*-amd64.deb \
  && rm rstudio-*-amd64.deb

COPY config/desktop.ini /root/.config/RStudio/desktop.ini

# Install tidyverse & cranvas deps
RUN R -e "install.packages(c( \
    'devtools', \
    'remotes', \
    'config', \
    'tidyverse', \
    'dplyr', \
    'dbplyr', \
    'scales', \
    'objectSignals', \
    'objectProperties', \ 
    'plumbr', \
    'SearchTrees', \
    'rggobi'))"

ENV R_REMOTES_NO_ERRORS_FROM_WARNINGS=true

RUN R -e "remotes::install_github(args = '--no-multiarch', INSTALL_opts = '--no-test-load', c( \
    'hadley/productplots', \
    'hadley/densityvis', \
    'ggobi/tourr@6ea6074', \          
    'ggobi/qtbase@qt4', \
    'ggobi/qtpaint@5a2a582', \
    'ggobi/cranvas', \
    'tsieger/idendro'))"
    
COPY cranvas_startup_patch.sh /cranvas_startup_patch.sh

ENTRYPOINT ["/startup.sh && /cranvas_startup_patch.sh"]

     
 


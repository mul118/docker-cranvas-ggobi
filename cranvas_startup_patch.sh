#!/bin/bash

# Startup patch to 'properly' install cranvas & idendro, so documentation is available. 
# Works around the issue of X server being unavailable during docker build process,
# Which makes cranvas installation via R CMD 'fail' before docs are compiled.
# Build process gets around this via the '--no-test-load' arg.

rm -R /usr/local/lib/R/site-library/00LOCK-cranvas
rm -R /usr/local/lib/R/site-library/00LOCK-idendro
R -e "remotes::install_github(args = '--no-multiarch', c('ggobi/cranvas', 'tsieger/idendro'), force = TRUE)"

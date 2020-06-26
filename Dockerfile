FROM rocker/tidyverse:4.0.0-ubuntu18.04
ARG PROJ=pharma202006
LABEL Name=${PROJ} Version=4.0.0

RUN apt-get -y update && \
    mkdir -p /home/rstudio/${PROJ}

WORKDIR /home/rstudio/${PROJ}

# copy preferences to make the GUI nicer
COPY rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json

COPY ["${PROJ}.Rproj", "renv.lock", "./"]
# add all of the renv folder, except the library which is marked out in .dockerignore
COPY renv ./renv
RUN chown -R rstudio:rstudio .
# -e "renv::load('/home/rstudio/${PROJ}')" \\
RUN R -e "install.packages(c('renv', 'here'), repos='https://packagemanager.rstudio.com/all/__linux__/bionic/latest')" -e "renv::restore(project='/home/rstudio/${PROJ}', repos='https://packagemanager.rstudio.com/all/__linux__/bionic/latest', prompt=FALSE)"
# -e "renv::restore(prompt=FALSE)"

# docker run --rm -p 8888:8787 -e PASSWORD=password --name ml4 jaredlander/pharma202006:4.0.0

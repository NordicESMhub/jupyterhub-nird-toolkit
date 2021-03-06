FROM quay.io/uninett/jupyterhub-singleuser:20191012-5691f5c

MAINTAINER Anne Fouilloux <annefou@geo.uio.no>

# Install packages
USER root
RUN apt-get update && apt-get install -y vim

# Install requirements for Python 3
ADD environment.yml environment.yml

# Python packages
RUN conda env create -f environment.yml && conda clean -yt && \
    pip install --no-cache-dir bioblend galaxy-ie-helpers nbgitpuller \
               dask_labextension ipydatawidgets sidecar geojsoncontour \
               cdsapi

RUN source activate pangeo && \
    /opt/conda/bin/ipython kernel install --user --name pangeo && \
    /opt/conda/bin/python -m ipykernel install --user --name=pangeo && \
    /opt/conda/bin/jupyter labextension install @jupyterlab/hub-extension \
                           @jupyter-widgets/jupyterlab-manager && \
    /opt/conda/bin/jupyter labextension install jupyterlab-datawidgets && \
    /opt/conda/bin/jupyter labextension install @jupyter-widgets/jupyterlab-sidecar && \
    /opt/conda/bin/jupyter labextension install @pyviz/jupyterlab_pyviz \
                           jupyter-leaflet   && \
    /opt/conda/bin/jupyter labextension install @jupyterlab/hub-extension @jupyter-widgets/jupyterlab-manager && \
    /opt/conda/bin/jupyter labextension install jupyter-leaflet jupyterlab-datawidgets nbdime-jupyterlab dask-labextension && \
    /opt/conda/bin/jupyter labextension install @jupyter-widgets/jupyterlab-sidecar && \
    /opt/conda/bin/jupyter labextension install @jupyterlab/geojson-extension


# Fix hub failure
RUN fix-permissions $HOME

# Install other packages
USER notebook

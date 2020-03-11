# jupyterhub-nird-toolkit

[Docker image](https://hub.docker.com/r/nordicesmhub/climate-nird-toolkit) for Jupyterhub [pangeo](http://pangeo.io/) NIRD toolkit.


## Activate pangeo conda environment in the jupyterhub

Open a terminal in the Jupyterhub:

```
source activate pangeo
python -m ipykernel install --user --name=pangeo
```

Then restart your server to see pangeo environment (as shown on the figure below).

![](pangeo.png)

## Pangeo software stack

```
source activate pangeo
python -m ipykernel install --user --name=pangeo
```


Also when you open a notebook, make sure to select **pangeo** for the kernel.



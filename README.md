`rvnpl` software can be downloaded at https://github.com/statgenetics/rvnpl.

Simulation studies and data analysis using RV-QNPL are documented on [this page](https://statgenetics.github.io/rvnpl-notes/analysis/QNPL_Simulation.html). 
The source code implementing the analysis workflow can be found [in this notebook](https://github.com/statgenetics/rvnpl-notes/blob/master/analysis/QNPL_Simulation.ipynb).

## Build and test docker image

```
cd docker
sos run rvnpl_image.sos build
sos run rvnpl_image.sos test
```

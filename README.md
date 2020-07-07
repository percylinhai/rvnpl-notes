`rvnpl` software can be downloaded at https://github.com/statgenetics/rvnpl.

Simulation studies and data analysis using RV-QNPL are documented on [this page](https://statgenetics.github.io/rvnpl-notes/analysis/QNPL_Simulation.html). 
The source code implementing the analysis workflow can be found [in this notebook](https://github.com/statgenetics/rvnpl-notes/blob/master/analysis/QNPL_Simulation.ipynb).

You need to have [SoS workflow and notebook suite](https://github.com/vatlab/sos-docs) installed to run these analysis.

To build and test out a dockerized version of `rvnpl`, please clone this repository to your computer and run:

```
cd docker
sos run rvnpl_image.sos build
sos run rvnpl_image.sos test
```

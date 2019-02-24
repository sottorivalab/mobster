# MOBSTER

MOBSTER (Model-based clustering in cancer) is a package to analyze bulk multi-region sequencing data of a cancer patient (ideally high-resolution WGS). 

MOBSTER is model-based as it combines the theoretical distributions predicted by population genetics (the model), with Machine Learning. The result is a `K+1`-dimensional Dirichlet mixture model with `K` Beta and one Pareto component, which can be used to reconstruct the clonal architecture of a tumour (subclonal deconvolution). 

The `K` Beta random variables model potential subclones detectable through the Variant allele Frequency (VAF) distribution, and the Pareto random variable models a power law tail - predicted by ppulation genetics - to describe alleles under neutral evolution (within-clone dynamics). MOBSTER fits can be computed via moment-matching or maximum-likelihood, and model selection can be done with several scores (BIC, ICL and reICL, a new reduced-entropy variation to ICL). 

A dedicated package - mvMOBSTER - helps you to analyse multiple sequencing samples per patient with MOBSTER.

Packages:
- mvMOBSTER: https://github.com/caravagn/mvMOBSTER

***
**Author:** [Giulio Caravagna](https://sites.google.com/site/giuliocaravagna/), _Institute of Cancer Research, UK_.

**Contact:** [[@gcaravagna](https://twitter.com/gcaravagna); [giulio.caravagna@icr.ac.uk](mailto:giulio.caravagna@icr.ac.uk)]







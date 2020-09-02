# ProkaryoticPangenome

Simulation of prokaryotic genome evolution along a phylogenetic tree written in Matlab (requires Bioinformatics Toolbox).
Genomes are repsrestend as arrays of 1's and 0's, indicating presence or absence of genes.
The evolutionary dynamics involves gene gain and gene loss.
It is assumed that there are two classes of genes with different gain and loss rates.

The function Main.m calls other functions, and generates three output csv files: 
- The simulated dataset
- Gene commonality
- Genome intersections

For details regarding genome intersections and gene commonality see the Citation below.

The function Main.m takes as input file names and paramters.

Filenames:
- in_TreeFileName - input phylogentic tree in Newick format file name
- out_ATGC_COG_FileName - name of output file for simulated dataset
- out_GeneCommonalityFileName - name of output file for gene commonality
- out_GenomeIntersectionsFileName - name of output file for genome intersections

 
Simulation parameters:
- p1_p - class 1 gain rate
- p1_m - class 1 loss rate
- p2_p - class 2 gain rate
- p2_m - class 2 loss rate
- x1 - initial number of class 1 genes
- x2 - initial number of class 2 genes
- L1 - class 1 gene pool size
- L2 - class 2 gene pool size 

Test.m is a sample file calling Main.m, to be used with input phylogenetic tree ATGC001.tre  


Written by Itamar Sela 2020
Citation: https://www.biorxiv.org/content/10.1101/2020.04.14.041392v1

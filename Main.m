function Main(in_TreeFileName,out_ATGC_COG_FileName,out_GeneCommonalityFileName,out_GenomeIntersectionsFileName,P1_p,P1_m,P2_p,P2_m,x1,x2,L1,L2)

% simulate genome evolution along a phylogenetic tree through gene gain and gene loss.
% Genomes are repsrestend as arrays of 1's and 0's, indicating presence or absence of genes.
% It is assumed that there are two classes of genes with different gain and loss rates.
% 
% Simulation parameters:
% p1_p - class 1 gain rate
% p1_m - class 1 loss rate
% p2_p - class 2 gain rate
% p2_m - class 2 loss rate
% x1 - initial number of class 1 genes
% x2 - initial number of class 2 genes
% L1 - class 1 gene pool size
% L2 - class 2 gene pool size 
%
% Weitten by Itamar Sela 2020
% citation: https://www.biorxiv.org/content/10.1101/2020.04.14.041392v1



%% simulate and save simulated dataset to output file
[genomes_names, ATGC_COG_species_matrix] = SimulateTree(in_TreeFileName,out_ATGC_COG_FileName,P1_p,P1_m,P2_p,P2_m,x1,x2,L1,L2);

%% calculate gene commonality and save to output file
CreateGeneCommonalityCSV(ATGC_COG_species_matrix,out_GeneCommonalityFileName);


%% calculate genome intersections and save to output file
CreateGenomeIntersectionsCSV(in_TreeFileName,out_GenomeIntersectionsFileName,genomes_names,ATGC_COG_species_matrix);

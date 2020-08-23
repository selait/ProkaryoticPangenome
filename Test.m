% run simulation under CGS-IGP assumptions for E. coli cluster
% https://www.biorxiv.org/content/10.1101/2020.04.14.041392v1



in_TreeFileName = 'ATGC001.tre';
out_ATGC_COG_FileName = 'ATGC_COG.csv';
out_GeneCommonalityFileName = 'g.csv';
out_GenomeIntersectionsFileName = 'I.csv';

P1_p = 563;
P1_m = 563;
P2_p = 3877;
P2_m = 3877;
x1 = 2929;
x2 = 1471;
L1 = 5e5;
L2 = 5e5;


Main(in_TreeFileName,out_ATGC_COG_FileName,out_GeneCommonalityFileName,out_GenomeIntersectionsFileName,P1_p,P1_m,P2_p,P2_m,x1,x2,L1,L2);

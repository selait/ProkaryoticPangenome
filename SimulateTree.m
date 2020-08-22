function [genomes_names, ATGC_COG_species_matrix] = SimulateTree(in_TreeFileName,out_ATGC_COG_FileName,P1_p,P1_m,P2_p,P2_m,x1,x2,L1,L2)
global X IX1 IX2

%% read phylogenetic tree
Tree = phytreeread(in_TreeFileName);
[Matrix, ID, Distances] = getmatrix(Tree);

SpeciesNamesTree = get(Tree,'LeafNames');
N = length(SpeciesNamesTree);

%% set initial genome at the tree root
L = L1+L2;

X = sparse(length(ID),L);
X(length(ID),1:round(x1)) = 1;
X(length(ID),(L1+1)+(1:round(x2))) = 1;

IX1 = 1:L1;
IX2 = (L1+1):L;

%% simulate along the tree
IX_currentStage = length(ID);

k_temp = 1;
while ~isempty(IX_currentStage)
    IX_NextStage = [];
    for i_node = 1:length(IX_currentStage)
        IX_temp = GoToNextNode(IX_currentStage(i_node),Matrix, Distances,P1_p,P1_m,P2_p,P2_m);        
        IX_NextStage = [IX_NextStage IX_temp];
    end    
    IX_currentStage = IX_NextStage;    
end

%% obtain leaves genomes and genome names 
IX = ismember(ID,SpeciesNamesTree);
ATGC_COG_species_matrix = X(IX,:);
genomes_names = ID(IX);

%% save simulated genomes
ATGC_COG_species_matrix_full = full(ATGC_COG_species_matrix);
fileID = fopen(out_ATGC_COG_FileName,'w');
for i=1:N
    fprintf(fileID,'%s',genomes_names{i}); 
    fprintf(fileID,',%i',ATGC_COG_species_matrix_full(i,:)); 
    fprintf(fileID,'\n');
end
fclose(fileID);




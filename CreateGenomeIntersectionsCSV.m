function CreateGenomeIntersectionsCSV(in_TreeFileName,out_GenomeIntersectionsFileName,genomes_names,ATGC_COG_species_matrix)

N = size(ATGC_COG_species_matrix,1); % number of genomes

Tree = phytreeread(in_TreeFileName);
Tree_genomes_names = get(Tree,'LeafNames'); % genome names from the tree

%% re-order genomes in the dataset according to the order of the tree
[~,IX] = ismember(Tree_genomes_names,genomes_names);
ATGC_COG_species_matrix = ATGC_COG_species_matrix(IX,:);
genomes_names = genomes_names(IX);

%% get and save genome sizes
x = full(sum(ATGC_COG_species_matrix,2)); % get genome sizes

fileID = fopen(out_GenomeIntersectionsFileName,'w');
for i=1:N    
    fprintf(fileID,'%i,%f,%i\n',1,0,x(i));  
end

%% get and save all k-mers

for i=2:N  
    IX_matrix = nchoosek(1:N,N-i); % all posibilities to i out of N genomes
    n = size(IX_matrix,1);
    IX_COG = arrayfun(@(ii)setdiff(1:N,IX_matrix(ii,:)),1:n,'UniformOutput',false);
    
    I = arrayfun(@(jj) full(sum(sum(ATGC_COG_species_matrix(IX_COG{jj},:),1)==i)),1:n); % get number of common genes in all i-mers    
    D = arrayfun(@(jj) sum(get(prune(Tree, IX_matrix(jj,:)),'Distances')),1:n); % prun the tree and get the total branch lengths of the i-mer subtree
    
    for j=1:length(I)
        fprintf(fileID,'%i,%12.40f,%i\n',i,D(j),I(j)); % print results to CSV file
    end
end
fclose(fileID);




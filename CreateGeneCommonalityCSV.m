function CreateGeneCommonalityCSV(ATGC_COG_species_matrix,out_GeneCommonalityFileName)

N = size(ATGC_COG_species_matrix,1);

gn = arrayfun(@(i)full(sum(sum(ATGC_COG_species_matrix,1)==i)),1:N);


fileID = fopen(out_GeneCommonalityFileName,'w');
for i=1:N
    fprintf(fileID,'%i,%i\n',i,gn(i));              
end
fclose(fileID);    
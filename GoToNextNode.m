function IX = GoToNextNode(i,Matrix,Distances,P1_p,P1_m,P2_p,P2_m)
global X IX1 IX2

IX = find(Matrix(i,:));
if ~isempty(IX)  
    for j=1:2	
		X(IX(j),:) = SimulateBranch(X(i,:),IX1,IX2,P1_p,P1_m,P2_p,P2_m,Distances(IX(j)));   
    end
end

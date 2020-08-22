function X = SimulateBranch(X,IX1,IX2,P1_p,P1_m,P2_p,P2_m,d)

X1 = X(IX1);
X2 = X(IX2);

x1 = sum(X1);
x2 = sum(X2);

t = 0;
while t<d
 	Pvec = [P1_p, P1_m, P2_p, P2_m];
    a0 = sum(Pvec);	
	tau = -log(rand)/a0;
	t = t + tau;   
	if t<=d 
        event = max(find(rand>=[0 cumsum(Pvec)/a0]));
		if event==1 % class 1 gene gain
		    x1 = x1 + 1;
		    IX = find(X1==0);            
		    X1(IX(randi(length(IX)))) = 1;            
		elseif event==2 % class 1 gene loss
		    x1 = x1 - 1;
		    IX = find(X1~=0);
		    X1(IX(randi(length(IX)))) = 0;
		elseif event==3 % class 2 gene gain
		    x2 = x2 + 1;
		    IX = find(X2==0);            
		    X2(IX(randi(length(IX)))) = 1;   
		elseif event==4 % class 2 gene loss
		    x2 = x2 - 1;
		    IX = find(X2~=0);            
		    X2(IX(randi(length(IX)))) = 0;   
 	       end                                                       				
	end
end
 
X = [X1 X2];

 

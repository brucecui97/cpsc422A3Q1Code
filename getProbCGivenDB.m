function prob_t = getProbCGivenDB(d,b)
if d==0 && b==0
    factor = [100*1,1*100];
elseif d==0 && b==1
      factor = [100*100,1*1];
        
elseif d==1 && b==0
     factor = [1*1,100*100];

elseif d==1 && b==1
     factor = [1*100,100*1];
else
    error('bc error msg')
end
prob_tf = factor/sum(factor);
prob_t = prob_tf(1);
end

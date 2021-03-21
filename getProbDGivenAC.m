function prob_t = getProbDGivenAC(a,c)
if a==0 && c==0
    factor = [1*100,100*1];
elseif a==0 && c==1
      factor = [1*1,100*100];
        
elseif a==1 && c==0
     factor = [100*100,1*1];

elseif a==1 && c==1
     factor = [100*1,1*100];
else
    error('bc error msg')
end

prob_tf = factor/sum(factor);
prob_t = prob_tf(1);
end

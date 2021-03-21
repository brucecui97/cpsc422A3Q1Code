%let a sample be represented as list[bool] of size 4
%where index 0 being true is a = t, index 1 being true is b = t, etc.

samples = [0,1,0,0]
for iteration = [1:10^5]
    iteration
    last_sample = samples(end,:);
    new_sample = last_sample;
    if rand<getProbAGivenDB(last_sample(4),last_sample(2))
        new_sample(1) = 1;
    else
        new_sample(1)=0;
    end
    
    last_sample = new_sample;
    new_sample = last_sample;
    if rand<getProbCGivenDB(last_sample(4),last_sample(2))
        new_sample(3) = 1;
    else
        new_sample(3)=0;
    end

    
    last_sample = new_sample;
    new_sample = last_sample;
    if rand<getProbDGivenAC(last_sample(1),last_sample(3))
        new_sample(4) = 1;
    else
        new_sample(4)=0;
    end
    samples(end+1,:) = new_sample;
end

%%

num_As = sum(samples(:,1));
num_samples = length(samples)

probAGivenb1 = num_As/num_samples

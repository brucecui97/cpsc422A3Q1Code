%let a sample be represented as list[bool] of size 4
%where index 0 being true is a = t, index 1 being true is b = t, etc.

samples = [0,1,0,0]
for iteration = [1:5*10^5]
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

prob_estimate = zeros(1,length(samples));
for num_samples_used = [1:length(samples)]
    num_samples_used
    sub_samples = samples(1:num_samples_used,:);
    num_As = sum(sub_samples(:,1));
    
    prob_estimate(num_samples_used) = num_As/num_samples_used;
end

%%
plot(prob_estimate(1:num_samples_used-1))
hold on
yline(0.05659);

xlabel("number of samples");
ylabel("Prob estimate from Gibbs Sampling");
title("Prob estimate from Gibbs Sampling vs number of samples used ")
legend("gibbs", "VE");
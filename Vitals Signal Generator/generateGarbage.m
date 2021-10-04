function g = generateGarbage(n,A)

% C = 1e-6;
m=5*240;
if n>m
    C = 15e-6+10e-6*randn(1); %15
    noise = randn(n,1);
    added_garbage=filter(C,[1 -(1-C)],noise);
    % added_garbage(1)=0;
    % for k=2:n;
    %     added_garbage(k) = noise(k)*C + added_garbage(k-1)*(1-C);
    % end

    % detrend
    added_garbage = detrend(added_garbage);
    % stretch to ptp=400;
    added_garbage = added_garbage-mean(added_garbage);
    % range = mean(added_garbage(481:end)-added_garbage(1:end-480));
    range = std(added_garbage);
    g = added_garbage/range*A;
    g = filtfilt(ones(61,1)/61,1,g); % LPF
%     g = filter(ones(61,1)/61,1,[zeros(60,1); g; zeros(60,1)]); %uncomment for running without signal processing toolbox

else
    C = 15e-6+10e-6*randn(1); %15
    noise = randn(m,1);
    added_garbage=filter(C,[1 -(1-C)],noise);
    added_garbage = detrend(added_garbage);
    % stretch to ptp=400;
    added_garbage = added_garbage-mean(added_garbage);
    range = std(added_garbage);
    g = added_garbage/range*A;
    g = filtfilt(ones(61,1)/61,1,g); % LPF
    
    g=g(1:n);
%     g = detrend(g);
    % stretch to ptp=400;
    g = g-mean(g);
    range = max(max(g)-min(g),std(g));
    if range~=0
        g = g/range*A/5;
    else
        g=0;
    end
end

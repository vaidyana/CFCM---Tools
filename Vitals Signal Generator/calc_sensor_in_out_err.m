

y_output=zes_detrend(x_output(500<=t & 1100>=t));
y_input=zes_detrend(x_input(500<=t & 1100>=t));

%% read reference signal (20 mintues)

% y_input = ????

%% read tested signal (20 mintues)

% y_output = ????

%% Calc the power spectrum - per 3 sec win, 1 sec overlap, NFTT=2^16
[P_output,f]=pwelch(y_output,240*3,240,2^16,240);
[P_input,f]=pwelch(y_input,240*3,240,2^16,240);

%% Find the K the provides the minimal err
Res = 0.002;
for z = 1:1000;
    eng_diff_vec(z) = sum(abs((1+z*Res)*P_output-P_input));
end

[minVal minLoc] = min(eng_diff_vec);
K = (1+minLoc*Res); %= 2.268

%% calc the eng for in, out and freq err
eng_in = sum(P_input);
eng_out = sum(P_output);
eng_diff = sum(abs(K*P_output-P_input));
err = 100*eng_diff/eng_in;
disp(['The err is ',num2str(err),' %']);


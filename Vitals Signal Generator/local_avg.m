function vec=local_avg(vec,n,type)%#codegen
%Calculates local average (window size n) of vec.
%vec ends are replicated
% Input: vec - a vector
%        n - the size of the window
%        type - type of the window
%               options: 'han' for hanning, 'ham' for hamming and 'box'
%               (default=box)
% Output: vec - a vector in the size of the original vector vec. with the
%               local average of each value.
%
% Syntax:
% vec=local_avg(vec,n,type)
%
% similar functions: local_avg_normal, local_max, local_max_int16, local_min,
%                    local_prctile, local_std.
%
% Zvika Shinar
% 7.5.06
%====================================================================



if nargin<3,
    type='box';
end

switch type
    case 'han'
        h=hanning(n);
        h=h/sum(h);
    case 'ham'
        h=hamming(n);
        h=h/sum(h);
    case 'ksr'
        h=kaiser(n,3);
        h=h/sum(h);
    case 'box'
        h=ones(1,n)/n;
    otherwise
        h=ones(1,n)/n;
end

half_n=floor(n/2);
vec=vec([ones(1,half_n),1:end,end*ones(1,half_n)]);
vec=conv(double(vec),double(h));
vec=vec(n:end-n+rem(n,2));
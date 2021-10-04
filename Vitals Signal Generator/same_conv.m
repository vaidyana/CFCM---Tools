function vec=same_conv(vec,template)
% ---------------------------------------------------------------------
% Recieves
%  none
% Returns
%   none
% Functions used:
% End Functions used
% $Revision: 2 $
% $Modtime: 7-10-08 1:34p $
% $NoKeywords: $
% Remarks:
% Earlysense propriety....
% ---------------------------------------------------------------------

% vec=conv(vec,template(end:-1:1));
vec=conv(vec,template);
len=length(template);
vec=vec(ceil(len/2):end-floor(len/2));
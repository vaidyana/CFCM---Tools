function vec=es_leftshift(vec,new_add)%#eml
% ---------------------------------------------------------------------
% vec=es_leftshift(vec,new_add)
% Recieves:
%   vec - the current data vector
%   new_add - the data which should be added to the vector in the end
%   (FILO)
%
% Returns:
%   vec - the updated data vector
%
% Functions used:
% End Functions used
% $Revision: 2 $
% $Modtim.e: 1-11-11 4:10p $
% Remarks
% Earlysense propriety....
% ---------------------------------------------------------------------

sz=size(vec);

if (sz(1) ==1)
    % row vector
    if size(new_add,1)~=1,
        new_add=new_add';
    end
    len=size(new_add,2);
    vec=[vec(len+1:end),new_add];

elseif (sz(2) ==1)
    % column
    new_add=new_add(:);
    len=size(new_add,1);
    vec=[vec(len+1:end);new_add];
else
    vec=vec(:);
    new_add2=new_add(:);
    len=length(new_add2);
    vec=[vec(len+1:end);new_add2];
    vec=reshape(vec,sz);
end

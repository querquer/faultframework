function str = actVec2str(act_vec)

fault_types = {'value correlated offset','time correlated offset','value correlated noise','time correlated noise','const offset','const noise','outlier','spike','stuck at zero','stuck at x','saturation','const delay','time correlated delay'};

str = [];
for idx=1:length(act_vec)
    if act_vec(idx) == 1
        str = [str '' fault_types(idx)];
    end
end
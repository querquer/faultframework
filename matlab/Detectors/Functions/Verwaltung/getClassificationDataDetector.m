%% GetClassificationDataDetector
% This function loads and formats the data from files to add a new detector
% to the framework. 'files' is a struct and contains information of all
% files associated wiht this class of dynamics.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code
function  [data_multifault, data_singlefault, trigger_multifault, trigger_singlefault] = getClassificationDataDetector(files, ind)

%load data_multifault and its trigger signals
t = load(files(ind).path);
data_multifault = transpose(t.faulty_data_mat{1,1}.Data);

strigger = size(t.faulty_data_mat{1,2});
for j = 1:strigger(1,2)
    trigger_multifault(j).data = t.faulty_data_mat{1,2}(j).data;
    trigger_multifault(j).name = char(t.faulty_data_mat{1,2}(j).name);
end

%load all activated singlefaults
failure = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
sc = size(files(ind).faultComb);
num = 1;
for i = 1:sc(1,2)
    if(files(ind).faultComb(i)==1)
        failure(i) = 1;
        %load corresponding file
        sf = size(files);
        for j = 1:sf(1,2)
            if(sum(files(j).faultComb ~= failure) == 0)
                % load file
                f = load(files(j).path);
                data_singlefault(num).name = char(f.faulty_data_mat{1,2}.name);
                data_singlefault(num).data = transpose(f.faulty_data_mat{1,1}.Data);
                trigger_singlefault(num).data = f.faulty_data_mat{1,2}.data;
                trigger_singlefault(num).name = char(f.faulty_data_mat{1,2}.name);
                num = num +1;
            end
        end
        failure(i) = 0;
    end
end

end


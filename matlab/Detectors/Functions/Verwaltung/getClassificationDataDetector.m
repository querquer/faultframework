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

%if there are only ones --> no fault_free data. We need to add some fault
%free data!

failure = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    % find faultfree dataset
    sf = size(files);
    for i=1:sf(1,2)
        if(sum(files(i).faultComb ~= failure) == 0)
            % load data from file
            k = load(files(i).path);
            data_multifault = [data_multifault transpose(k.faulty_data_mat{1,1}.Data)];
            sdata = size(k.faulty_data_mat{1,1}.Data);
            sfreedata = sdata(1,1);
            break;
        end
    end

strigger = size(t.faulty_data_mat{1,2});
for j = 1:strigger(1,2)
    trigger_multifault(j).data = t.faulty_data_mat{1,2}(j).data;
    trigger_multifault(j).data = [trigger_multifault(j).data zeros(1,sfreedata)];

    trigger_multifault(j).name = char(t.faulty_data_mat{1,2}(j).name);
end

%load all activated singlefaults

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


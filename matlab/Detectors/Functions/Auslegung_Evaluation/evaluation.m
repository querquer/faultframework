function [fn, fp] = evaluation(trigger, detection, max_delay)
%EVALUATION calculates false-positve rate and false-negativ rate for all
%fault types in 'trigger'
%   As we assume that 'trigger', as well as 'detection' containing data for
%   different fault types, we just check the format of this variables and
%   determine the false-positives-rates and false-negatives-rates for every
%   fault type by calling the function 'evaluation_FNFP'. 

%check format of input data
sd = size(detection);
st = size(trigger);

if(sd == st)
    fields = {'name', 'data'};
    if(isfield(detection, fields))   
        for i = 1:sd(1,2); 
            sd1 = size(detection(i).data);
            sd2 = size(trigger(i).data);
                    
            if(sd1 ~= sd2)
                msgID = 'design_detector:wrong_format';
                msg = 'Number of samples in "detection.data" does not match to the number of samples of "trigger.data"! Check the implementation of "output_detector*.m". Output must have the same format as "trigger"';
                baseException = MException(msgID,msg);
                throw(baseException);
            end
        end
    else
        msgID = 'design_detector:wrong_format';
        msg = 'Fields of "detection" does not match to the fields of "trigger"! Check the implementation of "output_detector*.m". Output must have the same format as "trigger"';
        baseException = MException(msgID,msg);
        throw(baseException);
    end
else
    msgID = 'design_detector:wrong_format';
    msg = 'Number of samples in "detection" does not match to the number of samples of "trigger"! Check the implementation of "output_detector*.m". Output must have the same format as "trigger"';
    baseException = MException(msgID,msg);
    throw(baseException);
end

%calculate false-negative and false-positive rate for every fault type
st = size(trigger);

for i = 1:st(1,2)
    [neg, pos] = evaluate_FNFP(trigger(i).data, detection(i).data, max_delay);
    fn(i).name = trigger(i).name;
    fn(i).fn_rate = neg;
    fp(i).name = trigger(i).name;
    fp(i).fp_rate = pos;
end

end


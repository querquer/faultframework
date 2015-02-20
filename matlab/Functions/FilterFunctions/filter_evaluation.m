function [quality] = filter_evaluation()

SimOut = sim('FailureProcessing.slx');
dataarray = SimOut.get('yout');
quality = dataarray(end,4);
end
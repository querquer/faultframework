function [quality, average_dist] = filter_evaluation()

SimOut = sim('FailureProcessing.slx');
dataarray = SimOut.get('yout');
quality = dataarray(end,4);
average_dist = dataarray(end,3);
end
function x0 = generate_starting_point_hm(num_faults)
%GENERATE_STARTING_POINT Generates a first configuration of a Hidden Markov
%Model

%% Configuration 'x' of an Hidden Markov Model
% x will describe the partition of the range of sensor observations in order
% to get a discrete representation. Maybe there are areas which are more
% important then other ones. Therefore the genetic algorithm will adapt x to
% get the best partition.

% Number of thresholds
x(1) = 25;

%% Defining thresholds
% --> using a function

%a
x(2) = 1;
%b
x(3) = 1;


for i = 1:num_faults
    if(i==1)
        x0 = x;
    else
        x0 = [x0 x];
    end
end

end


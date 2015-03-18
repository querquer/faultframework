function [best_net, best_fn, best_fp] = train_nn(net, data, trigger, windowsize, lc_thr)
%TRAIN_NN Summary of this function goes here
%   Detailed explanation goes here
%calculate input data
wsize = round(windowsize) + 1;
inp = createInput_NN(data,wsize);

sd = size(data);
trg = trigger(1,wsize:sd(1,2));


%configure nn
net = unconfigure(net);
net = init(net);
    
    

for i = 1:10
    %train nn
    n = train(net, inp, trg);
    
    %calcuate fn and fp
    det = sim(n, inp);
    det = lc_check(det, lc_thr);
    st = size(trigger);
    [fn, fp] = evaluate_FNFP(trigger(1,round(windowsize) + 1:st(1,2)), det);
    
    %check, whether its better or not
    if(exist('best_net', 'var'))
        if(best_fnfp > (fn+fp)/2)
            best_net = n;
            best_fnfp = (fn+fp)/2;
            best_fn = fn;
            best_fp = fp;
        end
    else
        best_net = n;
        best_fnfp = (fn+fp)/2;
        best_fn = fn;
        best_fp = fp;
    end
    
end

end


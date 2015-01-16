function out = output_detector_lc( x, data, trigger )
%OUTPUT_DETECTOR_LC calculates the output of a detector based on limit
%checking with respect to configuration "x"


%check input data 
sd = size(data);
st = size(trigger);
if(sd(1,2) ~= st(1,2))
    msgID = 'output_detector_lc:data format';
    msg = 'Number of samples in "data" does not match number of samples in "trigger"! Is the format of "data" or "trigger" wrong?';
    baseException = MException(msgID,msg);
    throw(baseException);
end

%get output for every fault type
for i = 1:sd(1,2)
    dt = data(i).data;
    
    sout = newton_polynom(x((i-1)*25+1:i*25), dt);
    
    det = [0,0,sout];
    det = lc_check(det, x((i-1)*25+1);
    
    out(i).name = trigger(i).name;
    out(i).data = det;
   
end


end


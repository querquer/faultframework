%% System definition
TRANS = [.9 .1; .05 .95;]
EMIS = [1/6, 1/6, 1/6, 1/6, 1/6, 1/6; 7/12, 1/12, 1/12, 1/12, 1/12, 1/12]

%% Generation of test data
[seq,states] = hmmgenerate(1000,TRANS,EMIS);

%% Estimating the state sequence
likelystates = hmmviterbi(seq, TRANS, EMIS);
% Evaluating the estimated sequence
sum(states==likelystates)/1000

%% Estimation of system definition
[TRANS_EST, EMIS_EST] = hmmestimate(seq, states)

%% Training
TRANS_GUESS = [.85 .15; .1 .9]
EMIS_GUESS = [.17 .16 .17 .16 .17 .17;.6 .08 .08 .08 .08 08]
[TRANS_EST2, EMIS_EST2] = hmmtrain(seq, TRANS_GUESS, EMIS_GUESS)

%% Decoding 
PSTATES = hmmdecode(seq,TRANS,EMIS)
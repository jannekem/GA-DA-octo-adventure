%initialize parameters
t_end = 100;
particleAmount = 100;
limits = [35000 65000; 2000000 6000000;
    0.001 0.05; 0.8 5; 0.6 0.95; 21000 48000;
    1.3 1.6; 0.8 0.99; 0.25 0.75;
    0.75 0.95; 0.01 0.1; 0.01 0.1]; % parameter limits
discrete_limits = [20 80; 1 3]; % indices for integer parameters

% generate the swarm and velocity matrices
swarm = zeros(t_end, particleAmount, 12);
swarmd = zeros(t_end, particleAmount, 2);
velocity = zeros(t_end, particleAmount, 12);
velocityd = zeros(t_end, particleAmount, 2);
bestpars = zeros(particleAmount, 12); % best parameters for each particle 
bestparsd = zeros(particleAmount, 2); % best discrete parameters ""
bestresults = zeros(particleAmount,1);
bestidx = 0;        % holder for the global best index
bestval = 0;

% initialize swarm
for ind = 1:particleAmount 
    for par = 1:12
       swarm(1,ind,par) = limits(par,1)+rand()*(limits(par,2)-limits(par,1));
    end
    swarmd(1,ind,1) = randi([20 80],1);
    swarmd(1,ind,2) = randi([1 3],1);
end
parfor ind = 1:particleAmount 
    params = combineparams(swarm(1,ind,:), swarmd(1,ind,:));
    [objects, constraints] = design_PMSM_generator(params);
    bestpars(ind,:) = swarm(1,ind,:);
    bestparsd(ind,:) = swarmd(1,ind,:);
    bestresults(ind) = evalobjects(objects, constraints);
end
[bestval, bestidx] = max(bestresults);


for t=1:t_end
    
end
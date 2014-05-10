clear all
bestvalues=[];  % best value of each run
parameters=[];  % best parameters of each run

values=[];      % the development of the values

iterations = 1000;
failures = 0;

for index = 1:iterations
    % read output from the jobs
    filename = strcat( 'genetic-output-', int2str( index ) );
    try
        load ( filename );
        parameters = [ parameters; elite ];
        bestvalues = [ bestvalues, max(elite_fitness) ];
        values = [values, elite_fitness'];
    catch
        disp ( sprintf ( 'FAILURE no file %s', filename ) );
        failures = failures + 1;
    end
    
   
end
mean_value = mean ( bestvalues )
variance = var ( bestvalues )
%hist ( bestvalues )
% remove all negative efficiencies
values = max(0,values);

%% (ii) Compute mean consumption
M = length(bestvalues);
N = length(elite_fitness);
stdv=zeros(1,N);
mv = zeros(1,N);
for indn = 1:N
    mv(indn)=sum(values(indn,:))/M;
    stdv(indn)=std(values(indn,:));
end


figure(2);
% create custom grayscale colormap
customColormap=[];
for ind = 1:70
    val = 250 - ind*1;
    customColormap = [customColormap; val,val,val];
end
customColormap = customColormap./255;


set(gca,'NextPlot','replacechildren','ColorOrder',customColormap)
plot(values);
hold on;
plot(mv,'r','Linewidth',4,'Color', 'b');
plot(mv+stdv,'k','Linewidth',2.5);
plot(mv-stdv,'k','Linewidth',2.5);
hold off;
xlabel('iteration');ylabel('efficiency');
%axis([0 10 0 30])
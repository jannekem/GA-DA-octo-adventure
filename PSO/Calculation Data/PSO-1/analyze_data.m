clear all
bestvalues=[];  % best value of each run
parameters=[];  % best parameters of each run

values=[];      % the development of the values

iterations = 1000;
failures = 0;

for index = 1:iterations
    % read output from the jobs
    filename = strcat( 'output-', int2str( index ) );
    try
        load ( filename );
        parameters = [ parameters; params ];
        bestvalues = [ bestvalues, bestval ];
        values = [values, bestvals];
    catch
        disp ( sprintf ( 'FAILURE no file %s', filename ) );
        failures = failures + 1;
    end
    
   
end
mean_value = mean ( bestvalues )
variance = var ( bestvalues )
%hist ( bestvalues )

%% MEAN
M = length(bestvalues);
N = length(bestvals);
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
axis([0 10000 0.98 0.99])

%% PLOT best values
figure(3)
customColormap=[];
for ind = 1:50
    val = 250 - ind*5;
    customColormap = [customColormap; val,val,val];
end
customColormap = customColormap./255;
colormap(customColormap)
scatter(parameters(:,11),parameters(:,12),[],values(end,:))
xlabel('Relative slot opening')
ylabel('Relative slot width')


figure(4)
colormap(customColormap)
scatter(parameters(:,9),parameters(:,10),[],values(end,:))

%% DEVELOPMENT of histogram
















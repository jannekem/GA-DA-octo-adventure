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

%%
parameters(330,12)

%% PLOT best values
customColormap=[];
for ind = 1:50
    val = 250 - ind*5;
    customColormap = [customColormap; val,val,val];
end
customColormap = customColormap./255;
colormap(customColormap)

figure(3)
colormap(customColormap)
scatter(parameters(:,1),parameters(:,2),[],values(end,:))
%xlabel('Relative slot opening')
%ylabel('Relative slot width')

figure(4)
colormap(customColormap)
scatter(parameters(:,3),parameters(:,4),[],values(end,:))

figure(5)
colormap(customColormap)
scatter(parameters(:,5),parameters(:,6),[],values(end,:))

figure(6)
colormap(customColormap)
scatter(parameters(:,7),parameters(:,8),[],values(end,:))

figure(7)
colormap(customColormap)
scatter(parameters(:,9),parameters(:,10),[],values(end,:))

figure(8)
colormap(customColormap)
scatter(parameters(:,11),parameters(:,12),[],values(end,:))

figure(9)
colormap(customColormap)
scatter(parameters(:,13),parameters(:,14),[],values(end,:))

%% DEVELOPMENT of histogram

hf = figure('color','white');
hold on

x = values(1,:);
y = values(2,:);
ht = hist(x,20);
set(ht,'XDataSource','x')
set(ht,'YDataSource','y')

drawnow

for t = 1:length(values,1)
    pause(0.05)
    x = values(t,:);
    refreshdata(hf,'caller');
    drawnow
end

%% 
figure(11)
gplotmatrix(parameters,[])











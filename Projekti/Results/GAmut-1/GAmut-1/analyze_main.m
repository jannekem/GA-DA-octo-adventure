clear all;

results = zeros(20,200);
for ind = 1:20
    indices = (1+50*(ind-1)):(49+50*(ind-1));
    results(ind,:) = analyze_data_ind(indices);
end
%%
figure(1);
hold on;

best = -inf;
best_ind = 0;
set(gca,'NextPlot','replacechildren','ColorOrder',copper)
plot(results');

figure(2)
plot(results(1,:),'b');
hold on;
plot(results(3,:),'r');
plot(results(5,:),'g');
plot(results(10,:),'k');
plot(results(20,:),'c');
legend('2.5%','7.5%','12.5%','25%','50%','Location', 'SouthEast');
title('effect of mutation chance on mean value');
xlabel('iteration'); ylabel('efficiency');

%{
best = -inf;
best_ind = 0;
for ind = 1:20
    if(results(ind,end) > best)
        best_ind=ind;
    end
    plot(results(ind,:));
end
%}
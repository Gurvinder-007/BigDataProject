function Plots(RunTime,RunTimeSeq)

%% Plotting graphs in Matlab


close all


%% Show two plots on different y-axes
%% 250 data processed
y1Vals = (RunTime);
figure(1)
yyaxis left
plot(y1Vals, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

%% 5,000 data processed



disp(RunTimeSeq)
a=RunTimeSeq(2);

y2Vals = a;
figure(2)
yyaxis left
plot(y2Vals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')


%% Show two plots on same y-axis
%% Mean processing time
y1MeanVals = y1Vals; 
y2MeanVals = y2Vals;

figure(3)
plot(y1MeanVals, '-bd')
hold on
plot(y2MeanVals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('Parallel', 'Sequential')
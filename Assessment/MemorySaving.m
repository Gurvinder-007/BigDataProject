%% This script allows you to open and explore the data in a *.nc file
clear all % clear all variables
close all % close all windows

FileName = 'C:/Users/Gurvinder Nagra/Documents/GitHub/5011CEM2022NagraG4/Model/o3_surface_20180701000000.nc'; % define the name of the file to be used, the path is included
Contents = ncinfo(FileName); % Store the file content information in a variable.


[TestTextChecker]=TestText(FileName);

if TestTextChecker==false

[ResultsSeq] = SequentialForLoop(FileName);

%disp(ResultsSeq)

[ResultsPar] = ParallelForLoop(FileName);

Plots(ResultsPar,ResultsSeq)

end






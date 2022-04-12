function [TestNan] = TestNanErrors(FileName)


%% Script to examine NetCDF data formats and check for NaN
% Note, you would carry out this test each time you load data.
% You should NOT test the whole file at the start

close all


%% Test File with Errors
NaNErrors = 0;
%% Set file to test
%%DataFileName = 'C:\Users\Gurvinder Nagra\Downloads\4c6ede5b8c139ad36720fb4bb4a98e5dmodel/Model/TestFileNaN214.nc'; % define our test file
%%FileName = 'C:\Users\Gurvinder Nagra\Downloads\4c6ede5b8c139ad36720fb4bb4a98e5dmodel/Model/o3_surface_20180701000000.nc'; % un rem this line to see what happens with good data
Contents = ncinfo(FileName); % Store the file content information in a variable.

%% Create and open log file
LogFileName = 'C:\Users\Gurvinder Nagra\AnalysisFile.txt';

% create new log file, 'w' replaces the file if present. To continually
% append, use 'a'
LogID = fopen('AnalysisFile.txt', 'a');
if LogID < 0
   fprintf('Failed to open myfile');
end
%%LogID= fopen('AnalysisLog.txt', 'a');
fprintf(LogID, '%s: Starting analysis of %s\n', datestr(now, 0), FileName);

StartLat = 1;
StartLon = 1;

fprintf('Testing files: %s\n', FileName)
for idxHour = 1:25
    
    for idxModel = 1:8
        Data(idxModel,:,:) = ncread(FileName, Contents.Variables(idxModel).Name,...
            [StartLat, StartLon, idxHour], [inf, inf, 1]); % 'inf' reads all the data
    end
    
    % check for NaNs
    if any(isnan(Data), 'All')
        NaNErrors = 1;
        %% display warning
        fprintf('NaNs present\n')
        ErrorModel = find(isnan(Data), 1, 'first');
        TestNan=true;
        %% find first error:
        fprintf('Analysis for hour %i is invalid, NaN errors recorded in model %s\n',...
            idxHour, Contents.Variables(ErrorModel).Name)
        
        % Write to log file
        fprintf(LogID, '%s: %s processing data hour %i\n', datestr(now, 0), 'NaN Error', idxHour);
    else
        % write to log file
        TestNan=false;
        fprintf(LogID, '%s: %s processing data hour %i\n', datestr(now, 0), 'Success', idxHour);
    end
    
end
 fclose(LogID);

if ~NaNErrors
    fprintf('No errors!\n')
end


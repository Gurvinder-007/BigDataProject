function [ReportResultsMem] = ReportResults(FileName, AllDataMem, LoadHoursMem, LoadAllHoursMem)
%% Section 5: Print our results

Contents = ncinfo(FileName); % Store the file content information in a variable.

fprintf('\nResults:\n')
fprintf('Memory used for all data: %.2f MB\n', AllDataMem)
fprintf('Memory used for hourly data: %.2f MB\n', LoadHoursMem)
fprintf('Maximum memory used hourly = %.2f MB\n', LoadAllHoursMem)
fprintf('Hourly memory as fraction of all data = %.2f\n\n', LoadHoursMem / AllDataMem)
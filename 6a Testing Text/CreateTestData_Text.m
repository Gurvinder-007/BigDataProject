%% Replaces one hours worth of data with empty strings
clear all
close all

FileIn = 'C:\Users\Gurvinder Nagra\Downloads\4c6ede5b8c139ad36720fb4bb4a98e5dmodel/Model/o3_surface_20180701000000.nc';
C = ncinfo(FileIn);
VarNames = {C.Variables.Name};


%% Move to new *.nc file
FileOut = 'TestyTest5.nc';
nccreate(FileOut, 'lat', 'Dimensions', {'lat', 400}, 'DataType', 'single');
ncwrite(FileOut, 'lat', ncread(FileIn, 'lat'));
nccreate(FileOut, 'lon', 'Dimensions', {'lon', 700}, 'DataType', 'single');
ncwrite(FileOut, 'lon', ncread(FileIn, 'lon'));
nccreate(FileOut, 'hour', 'Dimensions', {'hour', 25}, 'DataType', 'single');
ncwrite(FileOut, 'hour', ncread(FileIn, 'hour'));

Model2Change = 6; % Select the model that will be overwritten with errors

for idx = 1:7
    if idx ~= Model2Change 
        Var = ncread(FileIn, VarNames{idx});
        nccreate('TestyTest5.nc', VarNames{idx},...
            'Dimensions', { 'lon', 700, 'lat', 400, 'hour', 25},...
            'DataType', 'single');
        ncwrite('TestyTest4.nc', VarNames{idx}, Var);
    else
        Var = ncread(FileIn, VarNames{idx});
        nccreate('TestyTest5.nc', VarNames{idx},...
            'Dimensions', { 'lon', 700, 'lat', 400, 'hour', 25},...
            'DataType', 'char');
        var = char(Var);
        ncwrite('TestyTest4.nc', VarNames{idx}, var);
    end
    
    
end


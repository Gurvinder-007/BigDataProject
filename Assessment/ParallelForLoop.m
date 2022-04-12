function [ResultsPar] = ParallelForLoop(FileName)

DataOptions = (1);
WorkerOptions = [1,2,3,4];
ResultsPar = [];

for idx1 = 1:length(DataOptions)
       DataParameter=DataOptions(idx1);
        for idx2=1:length(WorkerOptions)
            WorkerParameter=WorkerOptions(idx2);
            [TestNan]=TestNanErrors(FileName);
            if TestNan==false
            [RunTime]=ParallelProcessing(FileName, DataParameter,WorkerParameter);
            ResultsPar=[ResultsPar;RunTime];
            else 
            end
        end           
end 


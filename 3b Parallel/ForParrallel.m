DataOptions = [1, 2, 3];
WorkerOptions = [1, 2, 3, 4];
Results = [];

for idx1 = 1:size(DataOptions,1)
       DataParameter=DataOptions(idx1);
        for idx2=1:size(WorkerOptions,1)
            WorkerParameter=WorkerOptions(idx2);
            [ParallelProcessing]=ParallelProcessing(DataParameter,WorkerParameter,Results);
            Results=[Results;WorkerParameter,DataParameter];
        end           
end 
Options = [1, 2, 3];
for idx = 1:size(Options,1)
 LoopParameter = Options(idx);
 SequentialProcessing=SequntialProcessing(LoopParameter);
 Results(idx,:) = [Options(idx), RunTime];
end

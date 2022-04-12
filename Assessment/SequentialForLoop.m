function [Results] = SequentialForLoop(FileName)

Options = (1);

for idx = 1:length(Options)
 LoopParameter = Options(idx);
 [TestNan]=TestNanErrors(FileName);
 if TestNan==false
 [RunTimeSeq]=SequntialProcessing(LoopParameter,FileName);
 Results= [Options(idx), RunTimeSeq];
 else
 end
end



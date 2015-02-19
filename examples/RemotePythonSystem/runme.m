clc;close all;clear all;

mode = 1;

switch mode
    case 1
        
        realSystem = RemoteSystem(...
            'nx',3,'nu',2,'StateFeedback',1,...
            'RemoteIp','127.0.0.1','RemotePort',20001,...
            'LocalIp' ,'127.0.0.1','LocalPort',20002,...
            ...%'StartingCommand',sprintf('python %s/Robot.py&',pwd),...
            'Controller',UniGoToPoint([-5;-5]));
        
    case 2
        
         realSystem = RemoteSystem(...
            'ny',3,'nu',2,...
            'RemoteIp','127.0.0.1','RemotePort',20001,...
            'LocalIp' ,'127.0.0.1','LocalPort',20002,...
            'StartingCommand',sprintf('python %s/Robot.py&',pwd),...
            'Controller',UniGoToPoint([-5;-5]));
        
        model = DtSystem(Unicycle(),0.1);
        model.h = @(x,u)x(1:3);

        realSystem.stateObserver = EkfFilter(model,...
                    'StateNoiseMatrix'  , eye(3),...
                    'OutputNoiseMatrix' , 20*eye(3),...
                    'InitialConditions' , [2*ones(3,1);
                                          10*reshape(eye(3),9,1)]);
                                      
end

a = VirtualArena(realSystem,...
    'StoppingCriteria',@(i,as)i>100,...
    'StepPlotFunction',@stepPlotFunctionPos, ...
    'DiscretizationStep',0.1);

a.run();

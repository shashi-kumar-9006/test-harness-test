run("Test_Harness_Automation.m");
%--------------------------------------------------------------------------
% Provide the same filename created to store the test results
exampleFile = 'Sample_Model_Results.mldatx';
sltest.testmanager.load(exampleFile);
%--------------------------------------------------------------------------
% Executing the test manager
result = sltest.testmanager.run;
%-------------------------------------------------------------------------
% Report Generation
sltest.testmanager.report(result,'C:\Users\39216\Desktop\SF_TESTHARNESS\test_repot.pdf',...
    'IncludeTestResults',0,'IncludeComparisonSignalPlots',true,...
    'IncludeSimulationSignalPlots',true,'NumPlotRowsPerPage',3);

%--------------------------------------------------------------------------
%-----------------------END OF SCRIPT--------------------------------------
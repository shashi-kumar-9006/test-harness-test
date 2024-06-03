clc;clear;close all;

% reading excel file
data=readtable("Inputs.xlsx");
%--------------------------------------------------------------------------
% reading time data 
time=data.Time;
% height returns the number of rows in the data 
% time = t'; % Transpose of the array gives the table
% -------------------------------------------------------------------------
% valA and valB are two variables that contains the data extracted from
% excel file's column 2 and 3 respectively

% Input for First Variable
valA = data.A;
% 2 represents column two

% Input for Second Variable
valB = data.B;
% 3 represents column three
% -------------------------------------------------------------------------
% Converting time data in Seconds
time = seconds(time);

% Creating Timetable for the both variables & loading them to the workspace
% Note : Use the same Input variable name as given in the model
A = timetable(time,valA);
B = timetable(time,valB);
%--------------------------------------------------------------------------
% Loading the simulink Model
load_system('Sample_Model');

% Creating the test harness having source as 'From Workspace' and Sink 'Outport'
% sltest.harness.create('Sample_Model', 'Name', 'Sample_Model_Harness', 'Source', 'From Workspace', 'Sink', 'Outport');

% Opening the test Harness model
sltest.harness.open('Sample_Model','Sample_Model_Harness');
%--------------------------------------------------------------------------
% test Manager
tf = sltest.testmanager.TestFile('Sample_Model_Results.mldatx');
ts = getTestSuites(tf);
tc = getTestCases(ts);

% To provide the Sample Model & Test Harness Model to the Test Manager
setProperty(tc,'Model','Sample_Model')
setProperty(tc, 'HarnessName', 'Sample_Model_Harness', 'HarnessOwner', 'Sample_Model');

% Capturing the Baseline
baseline = captureBaselineCriteria(tc,'Sample_Model_Baseline.xlsx',true);
sc = getSignalCriteria(baseline);
sc(1).AbsTol = 9;

% Opening the test Manager & Running the test cases
sltest.testmanager.view;
sltest.testmanager.run();

%-------------------------------------------------------------------------
%----------------------END OF THE SCRIPT----------------------------------


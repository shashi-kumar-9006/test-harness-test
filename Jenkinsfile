// Declarative Pipeline
pipeline {
   agent any
   environment {
       PATH = "C:\\Program Files\\MATLAB\\R2023b\\bin;${PATH}"   // Windows agent 
   }
    stages {
        // stage('Pehla_Kadam') {
        //     steps {
        //        runMATLABCommand(command: 'disp("Hello World!")')
        //     }       
        // }
       
       // stage('Testcases') {
       //      steps {
       //          runMATLABTests(testResultsJUnit: 'test-results/results.xml',
       //                         codeCoverageCobertura: 'code-coverage/coverage.xml', 
       //                           testResultsPDF: 'test-results/testreport.pdf')
       //      }
       //  }
      stage('Test Harness'){
        steps{
          runMATLABCommand(command: 'Test_Harness_Automation')
        }
      }
       stage('Test Harness1'){
        steps{
          runMATLABCommand(command: 'Report_Generation')
        }
      }
       stage('Testcases') {
            steps {
                runMATLABTests(testResultsJUnit: 'test-results/results.xml',
                               codeCoverageCobertura: 'code-coverage/coverage.xml', 
                                 testResultsPDF: 'test-results/testreport.pdf')
            }
        }

    }
   } 


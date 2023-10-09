pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
         
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/jagadamma/mern.git']]])
            }
        }
        
        stage('Install Dependencies') {
            steps {
               
                sh 'curl -sL https://deb.nodesource.com/setup_14.x | bash -'
                sh 'apt-get install -y nodejs'
                }
            }
        }
        
        stage('Build') {
            steps {
                dir('client') {
                    sh 'npm i'
                    sh 'run start'
                    sh 'npm run build'
                }
            }
        }
        
        stage('Test & Deploy') {
            steps {
                dir('server') {
                  sh 'npm install -g pm2'
                  sh 'npm i'
                  sh 'pm2 start index.js'
                }
                sh 'docker-compose up -d
            }
        }

}

    

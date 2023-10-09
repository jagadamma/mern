pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the GitHub repository
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/jagadamma/mern.git']]])
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // Install Node.js and npm
                script {
                    sh 'curl -sL https://deb.nodesource.com/setup_14.x | bash -'
                    sh 'apt-get install -y nodejs'
                }
            }
        }
        
        stage('Build Client') {
            steps {
                // Build the client application
                dir('client') {
                    sh 'npm install' // Use 'npm install' to install dependencies
                    sh 'npm run build'
                }
            }
        }
        
        stage('Start Server') {
            steps {
                // Start the server application
                dir('server') {
                    sh 'npm install -g pm2' // Install PM2 globally
                    sh 'npm install' // Use 'npm install' to install server dependencies
                    sh 'pm2 start index.js' // Start the server with PM2
                }
            }
        }
        
        stage('Deploy with Docker Compose') {
            steps {
                // Deploy the application using Docker Compose
                sh 'sudo docker-compose up -d'
            }
        }
    }
}

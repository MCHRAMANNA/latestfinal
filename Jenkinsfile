pipeline {
  agent {
  label 'Docker' // Specify the label of the Docker agent
  }
  stages {
      stage ('docker clean') {
          steps {
            script {
          // Check if the Docker container is running
          def containerId = sh(returnStdout: true, script: 'sudo docker ps -aq --filter "name=tomcat_container"').trim()
          if (containerId) {
            // Stop and remove the Docker container
            sh 'sudo docker stop tomcat_container'
            sh 'sudo docker rm tomcat_container'
            echo 'Container stopped and removed'
          } else {
            echo 'Container not found or not running'
          }
          
          // Check if the Docker image exists
          def imageId = sh(returnStdout: true, script: 'sudo docker images -q tomcat_image').trim()
          if (imageId) {
            // Delete the Docker image
            sh 'sudo docker rmi tomcat_image'
            echo 'Image deleted'
          } else {
            echo 'Image not found'
          }
        }
      }
    }
          
 
      stage ('scm checkout') {
          steps {
          git credentialsId: 'github_pat', url: 'https://github.com/MCHRAMANNA/latestfinal.git/'
     }
   }  
 
      stage ('build') {
          steps {
          sh 'mvn clean package'
     }      
    }      
      stage ('Unit test') {
          steps {
          sh 'mvn test'
     }
     }
      stage ('Deploy docker') {
          steps {
          sh 'ls -a'
          sh 'sudo docker build -t tomcat_image .'
          sh 'sudo docker run -p 8080:8080 --name tomcat_container -d tomcat_image'
          
     }
     }
      
  }
    
   
   }  

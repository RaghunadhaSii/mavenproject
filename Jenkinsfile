node ('slaves') 
{
    //def server = Artifactory.newServer url: 'http://3.7.248.31:8081/artifactory', username: 'jenkins', password: 'admin@123'
    //def rtMaven = Artifactory.newMavenBuild()
    //def buildInfo   
   def MavenHome = tool name: 'Maven3.6.3', type: 'maven'
   def buildNumber = BUILD_NUMBER
   stage('CheckoutCode') { 
       git 'https://github.com/RaghunadhaSii/mavenproject.git'
   }
   stage ('Maven Build') {
      sh "${MavenHome}/bin/mvn clean package"
      
        // sh '/var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/Maven3.6.3/bin/mvn clean install deploy'
    }
    stage('Build Docker Image'){
        sh 'docker build -t docker/java-webapp:${buildNumber} .'
    }
    /*stage('push Dockerfile to Jfrog'){
        //sh 'zip Dockerfile.zip Dockerfile .'
        sh 'curl -X PUT -u jenkins:admin@123 -T /var/lib/jenkins/workspace/JfrogDemo/Dockerfile "http://13.232.169.102:8081/artifactory/docker-repo/Dockerfile"'
        sh 'curl -X PUT -u jenkins:admin@123 -T /var/lib/jenkins/workspace/JfrogDemo/target/myapp-1.0-SNAPSHOT.jar "http://13.232.169.102:8081/artifactory/docker-repo/myapp-1.0-SNAPSHOT.jar"'
        
        //sh 'curl -X PUT -u jenkins:admin@123 -T jenkins/docker-repo:img "http://3.7.248.31:8081/artifactory/docker-repo/mydockerimg"'
         //sh 'curl -u jenkins:AP5CwLCs5fTaMJzYcXwPSZBjFMu -T /var/lib/jenkins/workspace/JfrogDemo/Dockerfile.zip "http://15.206.127.210:8081/artifactory/docker-repo/Dockerfile.zip"'
        
        
    } */
    
  /*  stage('download Dockerfile to Jfrog') {
        
        sshagent(['Jfrog_Credentional']) {
       sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.6.232'
         sh 'curl -X GET -u jenkins:admin@123 -O "http://13.232.169.102:8081/artifactory/docker-repo/myapp-1.0-SNAPSHOT.jar"' 
}
        
        //sh 'curl -X GET -u jenkins:admin@123 -O "http://15.206.147.62:8081/artifactory/docker-repo/Dockerfile" 13.127.48.111
    }*/

   
   
}











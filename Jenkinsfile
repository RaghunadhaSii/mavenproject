node () 
{
    //def server = Artifactory.newServer url: 'http://3.7.248.31:8081/artifactory', username: 'jenkins', password: 'admin@123'
    //def rtMaven = Artifactory.newMavenBuild()
    //def buildInfo   
   def MavenHome = tool name: 'Maven3.6.3', type: 'maven'
   //def MavenHome = /var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/Maven3.6.3/
   stage('CheckoutCode') { 
       git 'https://github.com/RaghunadhaSii/mavenproject.git'
   }
   stage ('Maven Package') {
      sh "${MavenHome}/bin/mvn clean install deploy"
      
        // sh '/var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/Maven3.6.3/bin/mvn clean install deploy'
    }
    stage('Build Docker Image'){
        sh 'docker build -t jenkins/docker-repo:img .'
    }
   /*stage('Push Docker Image'){
        withCredentials([string(credentialsId: 'Docker_Hub_Pwd', variable: '')]) {
           sh "docker login -u raghu046 -p ${Docker_Hub_Pwd}"
    
}
        sh 'docker push raghu046/java-web-app'
     }*/
   
   
}











node () 
{
   def MavenHome = tool name: 'Maven3.6.3', type:maven
   stage('CheckoutCode') { 
       git 'https://github.com/RaghunadhaSii/mavenproject.git'
   }
   stage ('Maven Package') {
      sh "${MavenHome}/bin/mvn clean install deploy"
      
        // sh '/var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/Maven3.6.3/bin/mvn clean install deploy'
    }
}











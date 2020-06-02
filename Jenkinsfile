//properties([parameters([choice(choices: ['master', 'development', 'feature', 'release'], description: 'select Branch to Build', name: 'branch')])])
node ('Agent1')
{
  def MavenHome = tool name: 'maven3.6.3', type: 'maven'
   stage('CheckoutCode') { 
       
       git 'https://github.com/RaghunadhaSii/mavenproject.git'
   }
   
   stage('Build'){
       sh "${MavenHome}/bin/mvn clean package"
   }
  
}

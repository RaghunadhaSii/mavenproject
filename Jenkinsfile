node ()
{
  
   def server = Artifactory.newServer url: 'http://ec2-15-206-211-187.ap-south-1.compute.amazonaws.com:8081/artifactory', username: 'jenkins', password: 'admin@123'
    def rtMaven = Artifactory.newMavenBuild()
    def buildInfo 
  environment {
         PATH = "${PATH}:${getmvnPath()}"
    }

   stage('CheckoutCode') { 
       git 'https://github.com/RaghunadhaSii/mavenproject.git'
   }
  
   stage('Build'){
       sh "mvn clean package"
      
   }
  
 /* stage ('Exec Maven') {
        rtMaven.run pom: '/var/lib/jenkins/workspace/JfrogDemo/mavenproject/pom.xml', goals: 'clean install', buildInfo: buildInfo
    } */
  
  
   stage ('Artifactory configuration') {
        rtMaven.tool = 'Maven3.6.3'
        rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local', server: server
        rtMaven.resolver releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot', server: server
        buildInfo = Artifactory.newBuildInfo()
    }
  
  stage ('Publish build info') {
        server.publishBuildInfo buildInfo
        
    }

def getmvnPath(){
    def mvnHome = tool name: 'Maven3.6.3', type: 'maven'
    return "${mvnHome}/bin"
}
}












node () 
{
    def server = Artifactory.newServer url: 'http://15.206.127.210:8081/artifactory', username: 'jenkins', password: 'admin@123'
    def rtMaven = Artifactory.newMavenBuild()
    def buildInfo 
    def uploadSpec 
    server.bypassProxy = true
  environment {
         PATH = "${PATH}:${getmvnPath()}"
    }

   stage('CheckoutCode') { 
       git 'https://github.com/RaghunadhaSii/mavenproject.git'
   }
   stage ('Maven Package') {
         sh 'mvn clean install deploy'
    }
    stage ('Artifactory configuration') {
        rtMaven.tool = 'mvnHome'
        rtMaven.deployer releaseRepo: 'jfrog-test-repo', snapshotRepo: 'jfrog-test-repo', server: server
        rtMaven.resolver releaseRepo: 'jfrog-test-repo', snapshotRepo: 'jfrog-test-repo', server: server
        buildInfo = Artifactory.newBuildInfo()
        //uploadjar = Artifactory.newuploadjar()
    }
  
    stage ('Publish build info') {
        server.publishBuildInfo buildInfo
        
    }
    stage ('Publish build jar') {
    
     server.upload   spec: uploadSpec
        
    }
}

def getmvnPath(){
    def mvnHome = tool name: 'Maven-3.6.0', type: 'maven'
    return "${mvnHome}/bin"
}


def uploadSpec = """{


  "files": [
    {
    
     echo "in files section uploadspec"
      "pattern": "/var/lib/jenkins/workspace/JfrogDemo/target/myapp-1.0-SNAPSHOT.jar",
      "target": "libs-release-local/JfrogDemo/"
    }
 ]
}"""

// server.upload spec: uploadSpec
//server.upload spec: uploadSpec, failNoOp: true








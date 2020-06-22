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
         sh 'mvn clean package'
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
        server.upload spec: uploadSpec, failNoOp: true
        
    }
}

def getmvnPath(){
    def mvnHome = tool name: 'Maven-3.6.0', type: 'maven'
    return "${mvnHome}/bin"
}

def uploadSpec = """{
  "files": [
    {
      "pattern": "${WORKSPACE}/$repoName/target/*.jar",
      "target": "artifactory-build-info/JfrogDemo/"
    }
 ]
}"""
// server.upload spec: uploadSpec
server.upload spec: uploadSpec, failNoOp: true









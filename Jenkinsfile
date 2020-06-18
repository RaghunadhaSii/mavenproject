node ()
{
  environment {
         PATH = "${PATH}:${getmvnPath()}"
    }

   stage('CheckoutCode') { 
       git 'https://github.com/RaghunadhaSii/mavenproject.git'
   }
   stage('Build'){
       sh "mvn package"
   }
}

def getmvnPath(){
    def mvnHome = tool name: 'Maven3.6.3', type: 'maven'
    return "${mvnHome}/bin"
}

def uploadSpec = """{
  "files": [
    {
      "pattern": "/var/lib/jenkins/workspace/JfrogDemo/target/*.jar",
      "target": "http://ec2-35-154-119-40.ap-south-1.compute.amazonaws.com:8082/artifactory/maven-snapshot/"
    }
 ]
}"""

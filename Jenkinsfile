node ()
{ 
  environment {
         PATH = "${PATH}:${getmvnPath()}"
    }

   stage('CheckoutCode') { 
       git 'https://github.com/RaghunadhaSii/mavenproject.git'
   }
  
   stage('Build'){
       sh "mvn clean package"
      
   }
  
}

def getmvnPath(){
    def mvnHome = tool name: 'Maven3.6.3', type: 'maven'
    return "${mvnHome}/bin"
}






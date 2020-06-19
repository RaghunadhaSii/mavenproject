node {
    def server = Artifactory.newServer url: 'http://ec2-3-7-248-145.ap-south-1.compute.amazonaws.com:8081/artifactory', username: 'jenkins', password: 'admin@123'
    def rtMaven = Artifactory.newMavenBuild()
    def buildInfo
    def mvnHome = tool name: 'Maven3.6.3', type: 'maven'

    stage ('Clone') {
        git url: 'https://github.com/jfrog/project-examples.git'
    }

    stage ('Artifactory configuration') {
        rtMaven.tool = 'Maven3.6.3'
        rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local', server: server
        rtMaven.resolver releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot', server: server
        buildInfo = Artifactory.newBuildInfo()
    }

    stage ('Exec Maven') {
        rtMaven.run pom: 'mavenproject/pom.xml', goals: 'clean install', buildInfo: buildInfo
    }

    stage ('Publish build info') {
        server.publishBuildInfo buildInfo
    }
}

pipeline {
    agent any
   
stages {
stage('Download from GCS') {
            steps{
                
                step([$class: 'DownloadStep', 
			credentialsId:"${projectId}",  bucketUri: "gs://${bucketName}/${gcsPath}/Dockerfile",
                      localDirectory: "/var/lib/jenkins/workspace"])
            }
        }

stage('Download from GCS') {
            steps{
                
                step([$class: 'DownloadStep', 
			credentialsId: "${projectId}",  bucketUri: "gs://${bucketName}/${gcsPath}/*.py",
                      localDirectory: "/var/lib/jenkins/workspace"])
            }
        }


stage('Build image') {
  app = docker.build("[${projectId}]/[${imageName]")
}
stage('Push image') {
  docker.withRegistry('https://gcr.io', 'gcr:[${projectId}]') {
    app.push("${tagNumber}")
    app.push("latest")
  }
}
}
}


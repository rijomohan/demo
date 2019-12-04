pipeline {
    agent any
   
stages {
stage('Download from GCS_DOckerfile') {
            steps{
                
                step([$class: 'DownloadStep', 
			credentialsId:"${projectId}",  bucketUri: "gs://${bucketName}/${gcsPath}/Dockerfile",
                      localDirectory: "/var/lib/jenkins/workspace/"])
            }
        }

stage('Download from GCS_pyfile') {
            steps{
                
                step([$class: 'DownloadStep', 
			credentialsId: "${projectId}",  bucketUri: "gs://${bucketName}/${gcsPath}/*.py",
                      localDirectory: "/var/lib/jenkins/workspace/"])
            }
        }


stage('Build image') {
	steps{
		script{
			app = docker.build("gcr.io/${projectId}/${imageName}")
		}
	}
}
stage('Push image') {
	steps{
  		step(docker.withRegistry('https://gcr.io', "gcr:${projectId}"){
    		app.push("${tagNumber}")
    		app.push("latest")})
  }
}
}
}

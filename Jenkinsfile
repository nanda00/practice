pipeline {
    agent any
	environment {
	    maven="/opt/maven/bin/mvn"
	    git_repo="https://github.com/nanda00/practice.git"
	    git_branch="dev"
	    AWS_Credentials_ID="AWS"
	    S3_bucket_name="yoga59builds"
	}
    stages {
        stage ('Continuous Download') {
            steps {
                git	branch: "${git_branch}", url: "${git_repo}"
            }
        	
		}
		stage ('Continuous Build') {
            steps {
                sh "'${maven}' package"
            }
        	
		}
		stage ('Copy artifact to S3') {
		    steps {
		        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_Credentials_ID}"]]) {
		            sh 'aws s3 cp "${WORKSPACE}"/webapp/target/webapp.war s3://"${S3_bucket_name}"'
		        }
		    }
		}
		stage('Building Docker Image') {
		    steps {
		        sh 'docker build -t myimage .'
		    }
		}
	}
}

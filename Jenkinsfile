node {
   deleteDir()
   stage('Checkout') {
      //checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres.git']]])
      sh "chmod +x job.sh"
   }
   stage('Sync') {
      sh "./job.sh"
   }
   stage('Push') {
      sshagent('a03d0639-7f59-4760-a5ad-dc3066f8fee5') {
         git credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/docker-library/postgres'
         sh "git push"
      }
   }
}

node {
   deleteDir()
   stage('Checkout') {
      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '0ca6f97f-4c25-43ac-924b-7a89baee3121', url: 'https://github.com/Produccion-UCI/postgres.git']]])
      sh "chmod +x job.sh"
   }
   stage('Sync') {
      sh "./job.sh"
   }
   stage('Push') {
      git credentialsId: '0ca6f97f-4c25-43ac-924b-7a89baee3121', url: 'https://github.com/docker-library/postgres'
      sh "git push"
   }
}

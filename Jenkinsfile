node {
   deleteDir()
   stage('Checkout') {
      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '0ca6f97f-4c25-43ac-924b-7a89baee3121', url: 'https://github.com/Produccion-UCI/postgres.git']]])
      sh "chmod +x job.sh"
      sh "./job.sh"
      sh "git push --set-upstream origin master"
   }
   stage('Sync') {
      
   }
   stage('Push') {
      
   }
}

node {
   deleteDir()

   stage('Checkout') {
      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e3c8fe88-883e-436b-9dac-1e9d25e7c983', url: 'https://github.com/Produccion-UCI/postgres.git']]])
      sh "chmod +x job.sh"
      //sh "./job.sh"
   }
   stage('Sync') {
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'e3c8fe88-883e-436b-9dac-1e9d25e7c983', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD']]) {
         sh "./job.sh"
         //sh("git push --set-upstream https://${env.GIT_USERNAME}:${env.GIT_PASSWORD}@github.com/Produccion-UCI/postgres.git master")
      }
   }
}

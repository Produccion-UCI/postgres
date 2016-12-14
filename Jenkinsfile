node {
   deleteDir()
   stage('Checkout') {
      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres.git']]])
   }
   stage('Syncing 1') {
      git credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/docker-library/postgres'
      sh 'git remote add upstream https://github.com/docker-library/postgres'
      sh 'git fetch upstream'
   }
   stage('Syncing 2') {
      sh 'git checkout master'
      sh 'git merge upstream/master'
   }
   stage('Push') {
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'e3c8fe88-883e-436b-9dac-1e9d25e7c983', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD']]) {
         sh("git push --set-upstream https://${env.GIT_USERNAME}:${env.GIT_PASSWORD}@github.com/Produccion-UCI/postgres.git master")
      }
   }
}

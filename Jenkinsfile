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
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '0ca6f97f-4c25-43ac-924b-7a89baee3121', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD']]) {
          sh("git tag -a ${env.BUILD_NUMBER} -m 'Jenkins'")
          sh("git push https://${env.GIT_USERNAME}:${env.GIT_PASSWORD}@github.com:Produccion-UCI/postgres.git --tags")
      }
   }
}

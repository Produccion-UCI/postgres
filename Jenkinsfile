node {
   deleteDir()
   stage('Checkout') {
      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres.git']]])
   }
   stage('Syncing') {
      git credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres.git'
      sh "git remote add upstream https://github.com/docker-library/postgres"
      sh "git fetch upstream"
      sh "git checkout master"
      sh "git merge upstream/master"
      sh "git push --set-upstream origin master"
   }
   stage('End') {
      git credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres.git'
      sh "git push"
   }
}

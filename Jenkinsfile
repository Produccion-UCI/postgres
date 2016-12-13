node {
   stage('Checkout')
      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres']]])
   stage('Syncing')
      git credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres'
      sh ''''
      git remote add upstream https://github.com/docker-library/postgres
      git fetch upstream
      git checkout master
      git merge upstream/master
      '''
   stage('End')
      sh "git push master"
}

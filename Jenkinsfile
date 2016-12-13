node {
   def fork = 'https://github.com/Produccion-UCI/postgres'
   def master = 'https://github.com/docker-library/postgres'
   stage('Checkout')
      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: '${fork}']]])
   stage('Syncing')
      git credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: '${fork}'
      sh """"
      git remote add upstream ${master}
      git fetch upstream
      git checkout master
      git merge upstream/master
      """"
   stage('End')
      sh "git push master"
}

node {
   stage('Checkout') {
      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres']]])
   }
   stage('Syncing') {
      sh(git fetch upstream)
      sh(git checkout master)
      sh(git merge upstream/master)
   }
   stage('End') {
      sh(git push)
   }
}

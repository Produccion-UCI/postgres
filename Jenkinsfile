node {
// stage ("Checkout") {
  
  //checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres.git']]])
 //}

 stage('Syncing') {
   //git branch: 'master', credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'git@github.com:Produccion-UCI/postgres.git'
    //git credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres.git'
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '0ca6f97f-4c25-43ac-924b-7a89baee3121', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD']]) {
     sh "git remote rm upstream"
    sh "git remote add upstream https://github.com/docker-library/postgres"
    sh "git fetch upstream"
    sh "git checkout master"
    sh "git merge upstream/master"
     //sh("git tag -a some_tag -m 'Jenkins'")
     //sh("git push --set-upstream origin master")
     //sh("git push --set-upstream https://${env.GIT_USERNAME}:${env.GIT_PASSWORD}@github.com:Produccion-UCI/postgres.git master")
    }
   sshagent (credentials: ['a03d0639-7f59-4760-a5ad-dc3066f8fee5']) {
    sh 'git push'
   }
 }
}

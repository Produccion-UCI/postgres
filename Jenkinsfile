node {
   // Borra la carpeta del job
   deleteDir()
   stage('Checkout') {
      // Chquea los cambios realizados
      checkout([$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e3c8fe88-883e-436b-9dac-1e9d25e7c983', url: 'https://github.com/Produccion-UCI/postgres.git']]])
   }
   stage('Sync') {
      // Importante, utilizar el tipo de autenticacion AskPassword para que funcione el push
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'e3c8fe88-883e-436b-9dac-1e9d25e7c983', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD']]) {
         // Clona nuevamente el proyecto, sino se incluye esta etapa en ocasiones falla el build
         git branch: 'master', url: 'https://github.com/Produccion-UCI/postgres.git'
         // Adiciona un remote del repo original y chequea los cambios existentes según los pasos
         // originales en: https://help.github.com/articles/syncing-a-fork/
         sh """ git remote add upstream 'https://github.com/docker-library/postgres'
               git fetch upstream
               git checkout master
               git merge upstream/master
            """
         // Hace push al fork con las credenciales especificadas, sino hay cambios, git no sube nada
         // Si todo esta bien, envia un correo Ok sino Fail
         try {
            sh "git push --set-upstream https://${env.GIT_USERNAME}:${env.GIT_PASSWORD}@github.com/Produccion-UCI/postgres.git master"
            sendEmails('Successful')
         } catch(Exception e) {
            sendEmails('Failure')
            throw e
         }
      }
   }
   stage('Run other job') {
      // Ejemplo: Build Debian Image
      build job: 'DGP_Build_Debian_Image', propagate: false, quietPeriod: 60, wait: false
   }
}

// To send emails to everyone relevant to this build (Requires Email-ext plugin)
// Correos a Yunier y a Ernesto [Docker]
def sendEmails(def status) {
   emailext body: "See ${env.BUILD_URL}", recipientProviders: [[$class: 'CulpritsRecipientProvider'], [$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
   subject: "[Jenkins Notification] Watch docker postgres repo - Build # ${env.BUILD_NUMBER} - ${status}!", to: "yjsosa@uci.cu, easantana@estudiantes.uci.cu";
}

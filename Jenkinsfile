#!/usr/bin/groovy

/*
 * Copyright (c) 2016, Andrey Makeev <amaksoft@gmail.com>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice unmodified, this list of conditions, and the following
 *    disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and|or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
node {
 // Env variables for git push
 env.J_USERNAME = "yuniers"
 env.J_EMAIL = "yjsosa@uci.cu"
 env.J_GIT_CONFIG = "true"
 // Use credentials id from Jenkins (Does anyone know a way to reference them by name rather than by id?)
 env.J_CREDS_IDS = '0ca6f97f-4c25-43ac-924b-7a89baee3121'

 def gitLib

 stage ("Checkout") {
  checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres.git']]])
  gitLib = load "git_push_ssh.groovy"
 }

 stage('Syncing') {
    git credentialsId: 'a03d0639-7f59-4760-a5ad-dc3066f8fee5', url: 'https://github.com/Produccion-UCI/postgres.git'
    sh "git remote rm upstream"
    sh "git remote add upstream https://github.com/docker-library/postgres"
    sh "git fetch upstream"
    sh "git checkout master"
    sh "git merge upstream/master"
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '0ca6f97f-4c25-43ac-924b-7a89baee3121', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD']]) {
     //sh("git tag -a some_tag -m 'Jenkins'")
     sh("git push --set-upstream origin master")
     sh("git push https://${env.GIT_USERNAME}:${env.GIT_PASSWORD}@github.com:Produccion-UCI/postgres.git")
    }
    // Push changes and tag
    //gitLib.pushSSH(commitMsg: "Jenkins build #${env.BUILD_NUMBER} from ${env.BRANCH_NAME}", 
      //tagName: "build/${env.BRANCH_NAME}/${env.BUILD_NUMBER}", files: ".", config: true);
 }
}

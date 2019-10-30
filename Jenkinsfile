node()
{
    checkout scm

    def user_id = sh(returnStdout: true, script: 'id -u').trim()
    def group_id = sh(returnStdout: true, script: 'id -g').trim()
    def jenkins_user_home = sh(returnStdout: true, script: "echo $HOME").trim()

    def myImage

    stage('Build privatized container')
    {
        // Provide UID and GID of jenkins user to the container build process
        myImage = docker.build("jenkins-sphinx-doc-builder:${env.BUILD_ID}",
            """ --build-arg USERID=${user_id} \
                --build-arg GROUPID=${group_id} \
                . """)
    }

    withEnv([
        'RELEASE=current',
        ])
    {

        stage('Build HTML') {
            myImage.run("html") {}
        }
        stage('Build PDF') {
            myImage.run("pdf") {}
        }

        myImage.inside("""
            --volume yocto-publish:/yocto/publish \
            """
        ) {
            stage('Publish HTML') {
                sh  """#!/bin/bash
                    mkdir -p /yocto/publish/docs/ /${RELEASE}
                    rsync -r -u --exclude 'x86_64*' build/html/* /yocto/publish/docs/${RELEASE}/
                    """
            }
        }
    }

}

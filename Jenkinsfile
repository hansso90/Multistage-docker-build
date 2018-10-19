node {
    checkout scm

    def customImage = docker.build("hello-world:${env.BUILD_ID}")

    customImage.inside {
        sh 'echo "success"'
    }
}
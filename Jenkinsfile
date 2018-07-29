def testString = "this is a test string"

def label = "masterNode"

def repoURL = "https://github.com/michaellady/testRepo"

def branch = "develop"

stage("Stage One") {
    def branches = [:]
    branches["branch1"] = {
        node(label) {
            sh("echo 1")
            sh("echo ${env.NODE_NAME}")
            checkout([
                $class: 'GitSCM', 
                branches: [[name: branch]], 
                extensions: [], 
                userRemoteConfigs: [[credentialsId: 'mike-github', url: repoURL]]
            ])

            sh("./test1.sh")
        }
    }
    branches["branch2"] = {
        node(label) {
            print("${testString} 2")
            checkout([
                $class: 'GitSCM', 
                branches: [[name: branch]], 
                extensions: [], 
                userRemoteConfigs: [[credentialsId: 'mike-github', url: repoURL]]
            ])

            sh("./test2.sh")
        }
    }
    parallel(branches)
}

stage("Stage Two") {
    node("mastrNode") {
        sh("echo 'something' >> somefile.txt")
        archiveArtifacts artifacts: "somefile.txt"
    }
}
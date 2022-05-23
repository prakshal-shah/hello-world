node {
        stage("Checkout") {
            steps {
              checkout(
                [$class: 'GitSCM',
                branches: [[name: '*/master']],
                extensions: [],
                userRemoteConfigs: [[url: 'https://github.com/mistryparas/hello-world.git']]
                ]
                )
            }
        }
        stage("Version update") {
            steps {
               sh  '''
               sed -i "s/myproject/nexustest2/g" ${WORKSPACE}/pom.xml 
               sed -i "s/0.0.1-SNAPSHOT/2.0.${BUILD_NUMBER}-SNAPSHOT/g" ${WORKSPACE}/pom.xml '''
            }
        }
        stage("Build") {
            steps {
               sh  '''mvn clean package '''
            }
        }
        stage("Upload Artifcat") {
            steps {
            nexusPublisher nexusInstanceId: 'Nexusrepos', nexusRepositoryId: 'grouptest2', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: './target/nexustest2-2.0.${BUILD_NUMBER}-SNAPSHOT.jar']], mavenCoordinate: [artifactId: 'nexustest2', groupId: 'com.example', packaging: 'jar', version: '2.0.${BUILD_NUMBER}-SNAPSHOT']]]
            }
        }
        stage("Build-dockerimage") {
            steps {
              sh '''mkdir ./docker
              cp -av ./target/nexustest2-2.0.${BUILD_NUMBER}-SNAPSHOT.jar ./docker
              cp -av /tmp/nexustest2 ./docker/Dockerfile
              cd ./docker
              sed -i \"s/BID/$BUILD_NUMBER/g\" Dockerfile
              docker build -t nexustest2:2.\${BUILD_NUMBER} .
              rm -rf nexustest2-2.0.${BUILD_NUMBER}-SNAPSHOT.jar'''
            }
        }
        stage("image push") {
            steps {
              sh '''cd ./docker
              docker login -u admin -p redhat 192.168.56.250:9092
              docker tag nexustest2:2.${BUILD_NUMBER} 192.168.56.250:9092/dockertest2:2.${BUILD_NUMBER}
              docker push 192.168.56.250:9092/dockertest2:2.${BUILD_NUMBER}
              docker rmi -f nexustest2:2.${BUILD_NUMBER} 192.168.56.250:9092/dockertest2:2.${BUILD_NUMBER}  '''
            }
        }

}

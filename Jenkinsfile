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
    
     
}

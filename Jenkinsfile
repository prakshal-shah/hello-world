node {
  stage("Checkout") {
      checkout(
            [$class: 'GitSCM',
            branches: [[name: '*/master']],
            extensions: [],
            userRemoteConfigs: [[url: 'https://github.com/mistryparas/hello-world.git']]
            ]
            )
        }
    
    
     
}

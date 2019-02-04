def testing_pods
    pod 'Quick'
    pod 'Nimble'
    pod 'OHHTTPStubs/Swift'
end

def core_pods
    #Code Style
    pod 'SwiftLint'
    
    ##Network Layer
    pod 'Alamofire'
end 

target 'Movizy' do
    use_frameworks!
    core_pods
    
    target 'MovizyTests' do
        testing_pods
    end
    
end

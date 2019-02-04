public final class Container {
    var storage: Storage = {
        return WeakStorage()
    }()    
}

extension Container {
    
    func register<Service>(_ serviceType: Service.Type, factory: @escaping (Resolver) -> Service) {
        self.register(serviceType, name: nil, factory: factory)
    }
    
    func register<Service>(_ serviceType: Service.Type, name: String?, factory: @escaping (Resolver) -> Service) {
        _register(serviceType, name: name, factory: factory)
    }
    
    private func _register<Service, Arguments>(_ serviceType: Service.Type,
                                               name: String?,
                                               factory: @escaping (Arguments) -> Service) {
        let serviceKey = ServiceKey(serviceType: Service.self,
                                    argumentsType: Arguments.self,
                                    name: name)
        
        let serviceEntity = ServiceEntity(serviceType: serviceType,
                                          argumentsType: Arguments.self,
                                          factory: factory)
        self.storage.setItem(serviceEntity, key: serviceKey)
    }
}

extension Container: Resolver {
    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return self.resolve(serviceType, name: nil)
    }
    
    func resolve<Service>(_ serviceType: Service.Type, name: String?) -> Service? {
        return resolve(name: name) { (factory: (Resolver) -> Any) in
            factory(self)
        }
    }

    private func resolve<Service, Arguments>(name: String?,
                                             invoker: ((Arguments) -> Any) -> Any) -> Service? {
        let serviceKey = ServiceKey(serviceType: Service.self, argumentsType: Arguments.self, name: name)
        let serviceEntity = self.storage.item(serviceKey)
        guard let factory = serviceEntity?.factory as? (Arguments) -> Service else {
            return nil
        }
        return invoker(factory) as? Service
    }
}

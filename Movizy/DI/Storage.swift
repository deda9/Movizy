protocol Storage {
    func item(_ key: ServiceKey) -> ServiceEntityProtocol?
    func setItem(_ item: ServiceEntityProtocol, key: ServiceKey)
}

class WeakStorage: Storage {
    private var instances = [ServiceKey: ServiceEntityProtocol]()
    
    func item(_ key: ServiceKey) -> ServiceEntityProtocol? {
        return instances[key]
    }
    
    func setItem(_ item: ServiceEntityProtocol, key: ServiceKey) {
        instances[key] = item
    }
}

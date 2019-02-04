typealias AnyType = Any.Type

struct ServiceKey {
    let serviceType: AnyType
    let argumentsType: AnyType
    let name: String?
    
    init(serviceType: AnyType, argumentsType: AnyType, name: String? = nil) {
        self.serviceType = serviceType
        self.argumentsType = argumentsType
        self.name = name
    }
}

extension ServiceKey: Hashable {
    var hashValue: Int {
        return ObjectIdentifier(self.serviceType).hashValue
            ^ ObjectIdentifier(self.argumentsType).hashValue
            ^ (self.name?.hashValue ?? 0)
    }
    
    static func == (lhs: ServiceKey, rhs: ServiceKey) -> Bool {
        return lhs.serviceType == rhs.serviceType &&
            lhs.argumentsType == rhs.argumentsType &&
            lhs.name == rhs.name
    }
}

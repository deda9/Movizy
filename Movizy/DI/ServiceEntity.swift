protocol ServiceEntityProtocol: AnyObject {
    var serviceType: AnyType { get }
    var argumentsType: AnyType { get }
    var factory: Any { get }
}

public final class ServiceEntity<Service>: ServiceEntityProtocol {
     let serviceType: AnyType
     let argumentsType: AnyType
     let factory: Any

    init(serviceType: Service.Type, argumentsType: AnyType, factory: Any) {
        self.serviceType = serviceType
        self.argumentsType = argumentsType
        self.factory = factory
    }
}

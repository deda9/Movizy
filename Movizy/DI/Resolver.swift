protocol Resolver {
    func resolve<Service>(_ serviceType: Service.Type) -> Service?
    func resolve<Service>(_ serviceType: Service.Type, name: String?) -> Service?
}

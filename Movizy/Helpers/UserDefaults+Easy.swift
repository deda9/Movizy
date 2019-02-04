import Foundation.NSUserDefaults

extension UserDefaults {
    
    class Keys {
        public typealias Key = UserDefaults.Key
        fileprivate init() {}
    }
    
    final class Key<T>: Keys {
        var name: String
        var defaultValue: T
        
        init(_ name: String, default defaultValue: T, with cashed: UserDefaults = .standard) {
            self.name = name
            self.defaultValue = defaultValue
            cashed.register(defaults: [name: defaultValue])
        }
    }
    
    subscript<T>(key: UserDefaults.Key<T>) -> T? {
        get {
            return self.object(forKey: key.name) as? T
        }
        set {
            self.set(newValue, forKey: key.name)
        }
    }
    
    func clear() {
        self.dictionaryRepresentation().keys.forEach {
            self.removeObject(forKey: $0)
        }
    }
}

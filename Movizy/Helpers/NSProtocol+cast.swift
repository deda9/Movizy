import Foundation

extension NSObjectProtocol {
    
    func cast<T, U>(_ object: T) -> U {
        let message = "Couldn't cast object '\(String(describing: object))' to '\(U.self)' file: \(#file), line: \(#line)"
        return self.cast(object, message: message)
    }
    
    func cast<T, U>(_ object: T, file: String = #file) -> U {
        let message = "Couldn't cast object '\(String(describing: object))' to '\(U.self)' file: \(file), line: \(#line)"
        return self.cast(object, message: message)
    }
    
    func cast<T, U>(_ object: T, file: String = #file, line: Int = #line) -> U {
        let message = "Couldn't cast object '\(String(describing: object))' to '\(U.self)' file: \(file), line: \(line)"
        return self.cast(object, message: message)
    }
    
    private func cast<T, U>(_ object: T, message: @autoclosure () -> String) -> U {
        guard let castedobject = object as? U else {
            fatalError(message)
        }
        return castedobject
    }
}

extension NSObjectProtocol {
    
    func cast<T, U>(_ object: T?) -> U? {
        let message = "Couldn't cast object '\(String(describing: object))' to '\(U.self)' file: \(#file), line: \(#line)"
        return self.cast(object, message: message)
    }
    
    func cast<T, U>(_ object: T?, file: String = #file) -> U? {
        let message = "Couldn't cast object '\(String(describing: object))' to '\(U.self)' file: \(file), line: \(#line)"
        return self.cast(object, message: message)
    }
    
    func cast<T, U>(_ object: T?, file: String = #file, line: Int = #line) -> U? {
        let message = "Couldn't cast object '\(String(describing: object))' to '\(U.self)' file: \(file), line: \(line)"
        return self.cast(object, message: message)
    }
    
    private func cast<T, U>(_ object: T?, message: @autoclosure () -> String) -> U? {
        guard let nonOptional = object else {
            return nil
        }
        
        guard let castedobject = nonOptional as? U else {
            fatalError(message)
        }
        return castedobject
    }
}

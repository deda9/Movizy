import Foundation

// swiftlint:disable identifier_name
public func Init<Type>(_ value: Type, block: (_ object: Type) throws -> Void) rethrows -> Type {
    try block(value)
    return value
}

public func doMainAsync(_ function: @escaping () -> Void) {
    DispatchQueue.main.async {
        function()
    }
}

public func perform(_ experssion: @autoclosure () throws -> Void,
                    onError: @autoclosure () -> Void) {
    do {
        try experssion()
    } catch {
        onError()
    }
}

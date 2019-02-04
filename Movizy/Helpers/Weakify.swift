
public func weakify<T: AnyObject>(_ owner: T, _ function: @escaping () -> Void) -> () -> Void {
    return { [weak owner] in
        return owner.map { _ in
            function()
        }
    }
}

public func weakify<T: AnyObject>(_ owner: T, _ function: Void) -> () -> Void {
    return { [weak owner] in
        return owner.map { _ in }
    }
}

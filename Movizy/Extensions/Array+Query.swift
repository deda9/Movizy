extension Array {
    subscript(of index: Int) -> Element? {
        guard !(index > count - 1) else {
            return nil
        }
        return self[index]
    }
}

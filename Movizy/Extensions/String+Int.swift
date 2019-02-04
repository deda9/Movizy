extension String {
    var toInt: Int {
        return Int("\(self)") ?? 0
    }
}

extension String {
    func localize() -> String {
        return self.localized(using: "Localization", in: .main)
    }
}

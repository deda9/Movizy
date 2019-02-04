import Foundation

extension String {
    func localized(in bundle: Bundle) -> String {
        return localized(using: nil, in: bundle)
    }
    
    func localized(using tableName: String?, in bundle: Bundle?) -> String {
        let bundle = bundle ?? .main
        
        if let path = bundle.path(forResource: Localize.currentLanguage(), ofType: "lproj"),
            let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: tableName)
        } else if let path = bundle.path(forResource: Localize.Defaults.bundle, ofType: "lproj"),
            let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: tableName)
        }
        
        return self
    }
}

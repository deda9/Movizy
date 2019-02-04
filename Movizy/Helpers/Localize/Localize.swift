import Foundation

class Localize {
    struct Keys {
        static let currentLanguage = UserDefaults.Key<String>("currentLanguage", default: "en")
    }
    
    struct Defaults {
        static let language = "en"
        static let bundle = "Base"
    }
    
    class func availableLanguages(_ excludeBase: Bool = false) -> [String] {
        return Bundle.main.localizations
    }
    
    class func defaultLanguage() -> String {
        var defaultLanguage: String = Localize.Defaults.language
        guard let preferredLanguage = Bundle.main.preferredLocalizations.first else {
            return defaultLanguage
        }
        
        if self.availableLanguages().contains(preferredLanguage) {
            defaultLanguage = preferredLanguage
        }
        return defaultLanguage
    }
    
    class func currentLanguage() -> String {
        let currentLanguage = UserDefaults.standard[Localize.Keys.currentLanguage]
        return currentLanguage ?? Localize.Keys.currentLanguage.defaultValue
    }
    
    class func setCurrentLanguage(_ language: String) {
        let selectedLanguage = self.availableLanguages().contains(language) ? language : self.defaultLanguage()
        if selectedLanguage != self.currentLanguage() {
            UserDefaults.standard[Localize.Keys.currentLanguage] = selectedLanguage
        }
    }
}

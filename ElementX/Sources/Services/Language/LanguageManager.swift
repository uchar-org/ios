//
//  LanguageManager.swift
//  Uchar
//
//  Created by G'aniyev Muhammad on 21/04/26.
//  Copyright © 2026 Uzinfocom. All rights reserved.
//

import SwiftUI

@Observable
class LanguageManager {
    @ObservationIgnored
    private let languageKey = "selected_language"
    
    var selectedLanguage: String {
        didSet {
            UserDefaults.standard.set([selectedLanguage], forKey: "AppleLanguages")
            UserDefaults.standard.set(selectedLanguage, forKey: languageKey)
            Bundle.overrideLocalizations = [selectedLanguage] // ← this is all you need
        }
    }
    
    init() {
        selectedLanguage = UserDefaults.standard.string(forKey: "selected_language") ?? "en"
        Bundle.overrideLocalizations = [selectedLanguage]
    }
    
    var locale: Locale {
        Locale(identifier: selectedLanguage)
    }
}

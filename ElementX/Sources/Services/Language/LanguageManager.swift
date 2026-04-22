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
}

enum AvailableLanguage: String, CaseIterable {
    case en, uz, ru, fr, es, ja
    
    var languageName: String {
        switch self {
        case .en: return "English"
        case .uz: return "O'zbekcha"
        case .ru: return "Pусский"
        case .fr: return "Français"
        case .es: return "Español"
        case .ja: return "日本語"
        }
    }
}

//
//  LanguageScreen.swift
//  Uchar
//
//  Created by Muhammad on 22/04/26.
//  Copyright © 2026 Uzinfocom. All rights reserved.
//

import SwiftUI

struct LanguageScreen: View {
    @Environment(LanguageManager.self) var languageManager

    var body: some View {
        List(AvailableLanguage.allCases, id: \.self) { lang in
            LanguageRow(title: lang.languageName, code: lang.rawValue)
        }
    }
}

// #Preview {
//    LanguageScreen()
////        .environment(LanguageManager())
// }

struct LanguageRow: View {
    let title: String
    let code: String
    @Environment(LanguageManager.self) var languageManager

    var body: some View {
        Button(action: {
            languageManager.selectedLanguage = code
        }) {
            HStack {
                Text(title)
                    .foregroundColor(.primary)

                Spacer()

                if languageManager.selectedLanguage == code {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                        .font(.system(size: 14, weight: .bold))
                }
            }
        }
    }
}

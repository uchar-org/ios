//
//  LanguageScreenCoordinator.swift
//  Uchar
//
//  Created by Muhammad on 22/04/26.
//  Copyright © 2026 Uzinfocom. All rights reserved.
//

import Combine
import SwiftUI

struct LanguageScreenCoordinatorParameters {
    let appSettings: AppSettings
    let language: AnalyticsService
}

final class LanguageScreenCoordinator: CoordinatorProtocol {
    func toPresentable() -> AnyView {
        AnyView(LanguageScreen())
    }
}

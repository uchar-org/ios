//
// Copyright 2025 Element Creations Ltd.
// Copyright 2023-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import SwiftUI
@_spi(Advanced) import SwiftUIIntrospect

extension PlatformViewVersionPredicate<NavigationStackType, UINavigationController> {
  public static var supportedVersions: Self {
    .iOS(.v17...)
  }
}

extension PlatformViewVersionPredicate<WindowType, UIWindow> {
  public static var supportedVersions: Self {
    .iOS(.v17...)
  }
}

extension PlatformViewVersionPredicate<TextFieldType, UITextField> {
  public static var supportedVersions: Self {
    .iOS(.v17...)
  }
}

extension PlatformViewVersionPredicate<ScrollViewType, UIScrollView> {
  public static var supportedVersions: Self {
    .iOS(.v17...)
  }
}

extension PlatformViewVersionPredicate<ViewControllerType, UIViewController> {
  public static var supportedVersions: Self {
    .iOS(.v17...)
  }
}

extension PlatformViewVersionPredicate<TabViewType, UITabBarController> {
  public static var supportedVersions: Self {
    .iOS(.v17...)
  }
}

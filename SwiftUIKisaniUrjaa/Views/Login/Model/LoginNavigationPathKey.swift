//
//  LoginNavigationPathKey.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 27/02/26.
//

import SwiftUI

private struct LoginNavigationPathKey: EnvironmentKey {
    static let defaultValue: Binding<NavigationPath>? = nil
}

extension EnvironmentValues {
    var loginNavigationPath: Binding<NavigationPath>? {
        get { self[LoginNavigationPathKey.self] }
        set { self[LoginNavigationPathKey.self] = newValue }
    }
}

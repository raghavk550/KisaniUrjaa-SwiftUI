//
//  ForgotAuthType.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 27/02/26.
//

import Combine
import SwiftUI

final class ForgotAuthType {
    var isForgotPass: Bool?
}

private struct ForgotAuthTypeKey: EnvironmentKey {
    static let defaultValue: ForgotAuthType? = nil
}

extension EnvironmentValues {
    var forgotAuthType: ForgotAuthType? {
        get { self[ForgotAuthTypeKey.self] }
        set { self[ForgotAuthTypeKey.self] = newValue }
    }
}

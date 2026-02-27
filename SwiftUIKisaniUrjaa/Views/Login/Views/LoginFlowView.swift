//
//  LoginFlowView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 27/02/26.
//

import SwiftUI

struct LoginFlowView: View {
    
    @State private var path = NavigationPath()
    private let forgotAuth = ForgotAuthType()
    
    var body: some View {
        NavigationStack(path: $path) {
            LoginView()
                .navigationDestination(for: LoginRoute.self) { route in
                    switch route {
                    case .forgot:
                        ForgotUserIdPassView(mobNo: .constant(""))
                    case .otp:
                        OTPView()
                    case .reset:
                        ResetAuthView()
                    case .updated:
                        ForgotAuthUpdatedView()
                    }
                }
        }
        .environment(\.forgotAuthType, forgotAuth)
        .environment(\.loginNavigationPath, $path)
    }
}

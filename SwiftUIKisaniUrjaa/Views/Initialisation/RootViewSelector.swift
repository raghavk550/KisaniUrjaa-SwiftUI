//
//  RootViewSelector.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 02/02/26.
//


import SwiftUI

struct RootViewSelector: View {
    @EnvironmentObject var appState: AppState
    private let forgotAuth = ForgotAuthType()

    var body: some View {
        switch appState.root {
        case .splash:
            NavigationStack {
                SplashView()
            }
        case .splash1:
            NavigationStack {
                SplashView1()
            }
        case .language:
            NavigationStack {
                ChooseLanguageView()
            }
        case .setupAccount:
            NavigationStack {
                SetupAccountView(mobNo: .constant(""))
            }
        case .login:
            LoginFlowView()
        case .createAccount:
            NavigationStack {
                CreateUserIdView(userId: .constant(""))
            }
        case .home:
            NavigationStack {
                HomeView()
            }
        case .mainHome:
            NavigationStack {
                MainHomeView()
            }
        }
    }
}

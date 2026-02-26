//
//  RootViewSelector.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 02/02/26.
//


import SwiftUI

struct RootViewSelector: View {
    @EnvironmentObject var appState: AppState

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
            NavigationStack {
                LoginView()
            }
        case .createAccount:
            NavigationStack {
                CreateUserIdView(userId: .constant(""))
            }
        case .home:
            NavigationStack {
                EmptyView()
            }
        }
    }
}

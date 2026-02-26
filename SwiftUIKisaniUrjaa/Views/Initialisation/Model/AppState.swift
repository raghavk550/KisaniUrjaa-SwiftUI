//
//  AppState.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 02/02/26.
//


import Combine

final class AppState: ObservableObject {
    @Published var root: RootView = .splash
}

enum RootView {
    case splash
    case splash1
    case language
    case setupAccount
    case login
    case createAccount
    case home
}

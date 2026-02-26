//
//  SplashView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 02/02/26.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            Image("splash2_img")
                .resizable()
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                appState.root = .splash1
            }
        }
    }
}

#Preview {
    NavigationStack {
        SplashView()
            .environmentObject(AppState())
    }
}

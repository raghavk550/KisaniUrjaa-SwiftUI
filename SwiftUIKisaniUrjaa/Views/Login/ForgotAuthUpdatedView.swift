//
//  ForgotAuthUpdatedView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 27/02/26.
//

import SwiftUI

struct ForgotAuthUpdatedView: View {
    @Environment(\.forgotAuthType) private var authType
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
            
            VStack(spacing: 16) {
                Image("tick_img")
                
                Text("\(authType?.isForgotPass ?? false ? "Password" : "User ID") Updated")
                    .padding(.horizontal, 10)
                    .font(.system(size: 24, weight: .semibold))
                
                Text("Your \(authType?.isForgotPass ?? false ? "password" : "user id") has been successfully updated.")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color(hex: "6C7278"))
                    .multilineTextAlignment(.center)
            }
            .padding(24)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 28)
                    .fill(Color.white)
            )
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                appState.root = .home
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        ForgotAuthUpdatedView()
            .environmentObject(AppState())
    }
}

//
//  OTPVerifiedView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 23/02/26.
//

import SwiftUI

struct OTPVerifiedView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
            
            VStack(spacing: 16) {
                Image("otp_verified_logo")
                
                Text("Verified Successfully")
                    .padding(.horizontal, 10)
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
        OTPVerifiedView()
            .environmentObject(AppState())
    }
}

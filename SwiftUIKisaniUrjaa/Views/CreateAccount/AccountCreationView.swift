//
//  AccountCreationView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 24/02/26.
//

import SwiftUI

struct AccountCreationView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .resizable()
                
                VStack(spacing: 28) {
                    Image("account-creation")
                    
                    Text("Thanks for joining us!")
                        .padding(.horizontal, 10)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(Color(hex: "161413"))
                    
                    Text("Your account is ready. Complete your profile to get started.")
                        .padding(.horizontal, 10)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color(hex: "353231"))
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
//                    appState.root = .createAccount
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    NavigationStack {
        AccountCreationView()
            .environmentObject(AppState())
    }
}

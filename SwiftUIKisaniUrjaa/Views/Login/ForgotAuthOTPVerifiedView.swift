//
//  ForgotAuthOTPVerifiedView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 27/02/26.
//

import SwiftUI

struct ForgotAuthOTPVerifiedView: View {
    @Environment(\.loginNavigationPath) private var path
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
            
            VStack(spacing: 16) {
                Image("tick_img")
                
                Text("Verified Successfully")
                    .padding(.horizontal, 10)
                    .font(.system(size: 24, weight: .semibold))
                
                Text("Your OTP has been successfully Verified")
                    .padding(.horizontal, 10)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color(hex: "6C7278"))
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
                path?.wrappedValue.append(LoginRoute.reset)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        ForgotAuthOTPVerifiedView()
    }
}

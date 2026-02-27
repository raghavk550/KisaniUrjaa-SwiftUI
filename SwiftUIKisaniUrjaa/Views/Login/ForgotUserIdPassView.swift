//
//  ForgotUserIdPassView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 27/02/26.
//

import SwiftUI

struct ForgotUserIdPassView: View {
    @Binding var mobNo: String
    @Environment(\.dismiss) private var dismiss
    @Environment(\.forgotAuthType) private var authType
    @Environment(\.loginNavigationPath) private var path
    
    var body: some View {
        ZStack {
            Image("chooseLangBg_img")
                .resizable()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image("backArrow")
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 60)
                
                Spacer()
            }
            
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(authType?.isForgotPass ?? false ? "Forgot Password" : "Forgot User ID")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(Color(hex: "161413"))
                    
                    Text("Enter your registered mobile number, we will send an OTP")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color(hex: "6C7278"))
                        .padding(.top, 12)
                    
                    WithOTPView(mobNo: $mobNo, isShowRequiredImg: false)
                    
                    Button {
                        path?.wrappedValue.append(LoginRoute.otp)
                    } label: {
                        Text("Get OTP")
                            .foregroundStyle(.white)
                            .frame(height: 56)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(red: 252/255, green: 128/255, blue: 25/255))
                            )
                    }
                    .padding(.top, 60)
                }
            }
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 28)
                    .fill(Color.white)
            )
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        ForgotUserIdPassView(mobNo: .constant(""))
    }
}

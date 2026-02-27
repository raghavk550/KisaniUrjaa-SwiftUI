//
//  LoginView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 24/02/26.
//

import SwiftUI
import Combine

enum AuthType {
    case otp
    case password
}

struct LoginView: View {
    @State private var mobNo: String = ""
    @State private var userId: String = ""
    @State private var pass: String = ""
    @EnvironmentObject var appState: AppState
    @State private var selected: AuthType = .otp
    @State private var isSecurePass: Bool = true
    @FocusState private var focusedField: PasswordField?
    @Environment(\.forgotAuthType) private var forgotAuth
    @Environment(\.loginNavigationPath) private var path
    
    var body: some View {
        ZStack {
            Image("chooseLangBg_img")
                .resizable()
            
            VStack {
                Image("logo_img")
                
                HStack(spacing: 0) {
                    Button {
                        focusedField = nil
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                            selected = .otp
                        }
                    } label: {
                        Text("With OTP")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundStyle(Color(hex: "000000"))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                RoundedCorner(radius: 8, corners: .allCorners)
                                    .fill(selected == .otp ? Color(hex: "ffffff") : Color.clear)
                            )
                    }
                    .padding(4)
                    
                    Button {
                        focusedField = nil
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                            selected = .password
                        }
                    } label: {
                        Text("User ID & Password")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundStyle(Color(hex: "000000"))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                RoundedCorner(radius: 8, corners: .allCorners)
                                    .fill(selected == .password ? Color(hex: "ffffff") : Color.clear)
                            )
                    }
                    .padding(4)
                }
                .frame(height: 40)
                .background(
                    RoundedCorner(radius: 8, corners: .allCorners)
                        .fill(Color(hex: "767680").opacity(0.12))
                )
                .padding(.top, 28)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text(selected == .otp ? "Enter your registered mobile number" : "Login with User ID & Password")
                        .padding(.top, 8)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color(hex: "6C7278"))
                    
                    ZStack(alignment: .top) {
                        if selected == .otp {
                            WithOTPView(mobNo: $mobNo, isShowRequiredImg: true)
                        }
                        
                        if selected == .password {
                            WithUserIdPassView(
                                userId: $userId,
                                pass: $pass,
                                isSecurePass: $isSecurePass,
                                focusedField: $focusedField,
                            ) { isForgotPass in
                                forgotAuth?.isForgotPass = isForgotPass
                                path?.wrappedValue.append(LoginRoute.forgot)
                            }
                        }
                    }
                    .animation(nil, value: selected)
                    
                    Button {
                        path?.wrappedValue.append(LoginRoute.otp)
                    } label: {
                        Text(selected == .otp ? "Get OTP" : "Continue")
                            .foregroundStyle(.white)
                            .frame(height: 56)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(red: 252/255, green: 128/255, blue: 25/255))
                            )
                    }
                    .padding(.top, 60)
                    
                    HStack(spacing: 5) {
                        Spacer()
                        
                        Text("Don’t have an account?")
                        
                        Button {
                            appState.root = .setupAccount
                        } label: {
                            Text("Sign Up")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(red: 252/255, green: 128/255, blue: 25/255))
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                }
                .padding(.top, 20)
            }
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 28)
                    .fill(Color.white)
            )
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        LoginView()
            .environmentObject(AppState())
    }
}

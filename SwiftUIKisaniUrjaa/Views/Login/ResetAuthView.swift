//
//  ResetAuthView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 27/02/26.
//

import SwiftUI

struct ResetAuthView: View {
    @Environment(\.forgotAuthType) private var authType
    @EnvironmentObject var appState: AppState
    @State private var pass: String = ""
    @State private var confirmPass: String = ""
    @State private var isSecurePass: Bool = true
    @State private var isSecureConfirmPass: Bool = true
    @FocusState private var focusedField: PasswordField?
    @State private var userId: String = ""
    @Environment(\.loginNavigationPath) private var path
    
    var body: some View {
        ZStack {
            Image("chooseLangBg_img")
                .resizable()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        path?.wrappedValue = NavigationPath()
                    } label: {
                        Image("cross_img")
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 60)
                
                Spacer()
            }
            
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(authType?.isForgotPass ?? false ? "Reset Password" : "Reset User ID")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(Color(hex: "161413"))
                    
                    Text(authType?.isForgotPass ?? false ? "Enter a new password" : "Enter a new user id")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color(hex: "6C7278"))
                        .padding(.top, 12)
                    
                    Text(authType?.isForgotPass ?? false ? "New Password" : "New User ID")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color(hex: "353231"))
                        .padding(.top, 28)
                    
                    if authType?.isForgotPass ?? false {
                        HStack(spacing: 10) {
                            Image("ic-password")
                            
                            ZStack {
                                SecureField("Create Password", text: $pass)
                                    .opacity(isSecurePass ? 1 : 0)
                                
                                TextField("Create Password", text: $pass)
                                    .opacity(isSecurePass ? 0 : 1)
                            }
                            .textContentType(.newPassword)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .focused($focusedField, equals: .password)
                            
                            Button {
                                isSecurePass.toggle()
                            } label: {
                                Image(isSecurePass ? "ic-eye-off" : "ic-eye")
                            }
                            
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 16)
                        .overlay(
                            RoundedCorner(radius: 12, corners: .allCorners)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.top, 6)
                        
                        HStack {
                            Text("Confirm Password")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(Color(hex: "353231"))
                            
                            Spacer()
                        }
                        .padding(.top, 24)
                        .frame(maxWidth: .infinity)
                        
                        HStack(spacing: 10) {
                            Image("ic-password")
                            
                            ZStack {
                                SecureField("Re-enter Password", text: $confirmPass)
                                    .opacity(isSecureConfirmPass ? 1 : 0)
                                
                                TextField("Re-enter Password", text: $confirmPass)
                                    .opacity(isSecureConfirmPass ? 0 : 1)
                            }
                            .textContentType(.newPassword)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .focused($focusedField, equals: .confirmPassword)
                            
                            Button {
                                isSecureConfirmPass.toggle()
                            } label: {
                                Image(isSecureConfirmPass ? "ic-eye-off" : "ic-eye")
                            }
                            
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 16)
                        .overlay(
                            RoundedCorner(radius: 12, corners: .allCorners)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.top, 6)
                    } else {
                        HStack(spacing: 10) {
                            Image("ic-user")
                            
                            TextField("Enter User Id", text: $userId)
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 16)
                        .overlay(
                            RoundedCorner(radius: 12, corners: .allCorners)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.top, 6)
                    }
                    
                    Button {
                        path?.wrappedValue.append(LoginRoute.updated)
                    } label: {
                        Text("Submit")
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
        ResetAuthView()
            .environmentObject(AppState())
    }
}

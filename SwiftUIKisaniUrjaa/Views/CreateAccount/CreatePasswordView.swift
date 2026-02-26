//
//  CreatePasswordView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 24/02/26.
//

import SwiftUI

enum PasswordField {
    case password
    case confirmPassword
}

struct CreatePasswordView: View {
    @State private var pass: String = ""
    @State private var confirmPass: String = ""
    @Environment(\.dismiss) private var dismiss
    @State private var isSecurePass: Bool = true
    @State private var isSecureConfirmPass: Bool = true
    @FocusState private var focusedField: PasswordField?
    
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
                Image("logo_img")
                
                VStack(alignment: .leading) {
                    Text("Create Password")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color(hex: "161413"))
                    
                    Text("This User ID and password will be used to login to the your account")
                        .font(.system(size: 14, weight: .medium))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color(hex: "6C7278"))
                        .padding(.top, 12)
                    
                    HStack {
                        Text("Password")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color(hex: "353231"))
                        
                        Spacer()
                    }
                    .padding(.top, 24)
                    .frame(maxWidth: .infinity)
                    
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
                    
                    Text("Password must be 8–20 characters with at least 1 letter and 1 number.")
                        .font(.system(size: 12, weight: .medium))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color(hex: "6C7278"))
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
                    
                    NavigationLink {
                        AccountCreationView()
                    } label: {
                        Text("Continue")
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
                .padding(.top, 28)
            }
            .padding(24)
            .background {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white)
            }
            .padding(.horizontal, 16)
            .offset(x: 0, y: 6)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        CreatePasswordView()
    }
}

//
//  WithUserIdPassView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 25/02/26.
//

import SwiftUI

struct WithUserIdPassView: View {
    @Binding var userId: String
    @Binding var pass: String
    @Binding var isSecurePass: Bool
    var focusedField: FocusState<PasswordField?>.Binding
    let forgotPressed: ((_ isForgotPass: Bool) -> ())
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 6) {
                Text("User ID")
                    .padding(.top, 24)
                
                HStack(spacing: 10) {
                    Image("ic-user")
                    
                    TextField("Enter User ID", text: $userId)
                }
                .frame(height: 56)
                .padding(.horizontal, 16)
                .overlay(
                    RoundedCorner(radius: 12, corners: .allCorners)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                HStack {
                    Spacer()
                    
                    Button {
                        forgotPressed(false)
                    } label: {
                        Text("Forgot User ID?")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(Color(hex: "FC8019"))
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Password")
                
                HStack(spacing: 10) {
                    Image("ic-password")
                    
                    ZStack {
                        SecureField("Create Password", text: $pass)
                            .opacity(isSecurePass ? 1 : 0)
                        
                        TextField("Create Password", text: $pass)
                            .opacity(isSecurePass ? 0 : 1)
                    }
                    .textContentType(.password)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .focused(focusedField, equals: .password)
                    
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
                HStack {
                    Spacer()
                    
                    Button {
                        forgotPressed(true)
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(Color(hex: "FC8019"))
                    }
                }
            }
            .padding(.top, 24)
        }
    }
}

#Preview {
    PreviewWrapper()
}

struct PreviewWrapper: View {
    @State private var userId: String = ""
    @State private var pass: String = ""
    @State private var isSecurePass: Bool = true
    
    @FocusState private var focusedField: PasswordField?
    
    var body: some View {
        WithUserIdPassView(
            userId: $userId,
            pass: $pass,
            isSecurePass: $isSecurePass,
            focusedField: $focusedField,
            forgotPressed: { _ in
            }
        )
        .padding(.horizontal, 20)
    }
}

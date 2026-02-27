//
//  SetupAccountView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 09/02/26.
//

import SwiftUI

struct SetupAccountView: View {
    @Binding var mobNo: String
    @EnvironmentObject var appState: AppState
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("chooseLangBg_img")
                    .resizable()
                
                VStack {
                    Image("logo_img")
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Set up account")
                            .multilineTextAlignment(.leading)
                            .font(.headline)
                        
                        Text("Enter your mobile number and We’ll send you a one-time verification code.")
                            .padding(.top, 12)
                            .font(.subheadline)
                        
                        HStack(spacing: 2) {
                            Text("Mobile Number")
                                .padding(.top, 24)
                            
                            Image("required_img")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 8, height: 20)
                                .offset(y: 9)
                        }
                        
                        HStack(spacing: 10) {
                            Text("+91")
                            
                            Text("|")
                            
                            TextField("Enter Mobile Number", text: $mobNo)
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 16)
                        .overlay(
                            RoundedCorner(radius: 12, corners: .allCorners)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.top, 6)
                        
                        NavigationLink {
                            OTPView()
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
                        
                        HStack(spacing: 5) {
                            Spacer()
                            Text("Already have an account?")
                            
                            Button {
                                appState.root = .login
                            } label: {
                                Text("Login")
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
}

#Preview {
    NavigationStack {
        SetupAccountView(mobNo: .constant(""))
            .environmentObject(AppState())
    }
}

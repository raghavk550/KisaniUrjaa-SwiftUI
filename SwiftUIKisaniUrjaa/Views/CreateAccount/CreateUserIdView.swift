//
//  CreateUserIdView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 23/02/26.
//

import SwiftUI

struct CreateUserIdView: View {
    @Binding var userId: String
    @State private var showTooltip = false
    
    var body: some View {
        ZStack {
            Image("chooseLangBg_img")
                .resizable()
            
            VStack {
                Image("logo_img")
                
                VStack(alignment: .leading) {
                    Text("Create User ID")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color(hex: "161413"))
                    
                    Text("This User ID and password will be used to login to the your account")
                        .font(.system(size: 14, weight: .medium))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color(hex: "6C7278"))
                        .padding(.top, 12)
                    
                    HStack {
                        Text("User ID")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color(hex: "353231"))
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                showTooltip.toggle()
                            }
                        } label: {
                            Image("info_img")
                        }
                    }
                    .padding(.top, 24)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .bottomTrailing) {
                        if showTooltip {
                            TooltipView(text: "User ID creation is restricted to English only.")
                                .offset(x: 10, y: -20)
//                                .transition(.opacity.combined(with: .scale))
                        }
                    }
                    
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
                    
                    NavigationLink {
                        CreatePasswordView()
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
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        CreateUserIdView(userId: .constant(""))
    }
}

//
//  OTPView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 09/02/26.
//

import SwiftUI

struct OTPView: View {
    @State private var otp: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedIndex: Int?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
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
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("OTP Verification")
                                .multilineTextAlignment(.leading)
                                .font(.headline)
                            
                            HStack(spacing: 4) {
                                Text("OTP sent to")
                                    .font(.subheadline)
                                    .foregroundStyle(Color(hex: "6C7278"))
                                
                                Text("+91 XXXXXX3210")
                                    .font(.subheadline)
                                    .foregroundStyle(Color(hex: "4D5256"))
                            }
                            .padding(.top, 12)
                            
                            VStack {
                                HStack(spacing: 10) {
                                    ForEach(0..<6, id: \.self) { index in
                                        TextField("X", text: $otp[index])
                                            .keyboardType(.numberPad)
                                            .multilineTextAlignment(.center)
                                            .frame(height: 56, alignment: .center)
                                            .background(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .fill(Color.white)
                                            )
                                            .overlay(
                                                RoundedCorner(radius: 12, corners: .allCorners)
                                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                            )
                                            .focused($focusedIndex, equals: index)
                                            .onChange(of: otp[index]) { oldValue, newValue in
                                                self.handleInput(newValue, at: index)
                                            }
                                    }
                                }
                                .padding(.top, 40)
                            }
                            
                            NavigationLink {
                                OTPVerifiedView()
                            } label: {
                                Text("Verify")
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
        .onAppear {
            focusedIndex = 0
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension OTPView {
    
    private func handleInput(_ value: String, at index: Int) {
        // Allow only 1 character
        if value.count > 1 {
            otp[index] = String(value.prefix(1))
        }
        
        // Move forward when typing
        if !value.isEmpty {
            if index < 5 {
                focusedIndex = index + 1
            } else {
                focusedIndex = nil
            }
        }
        
        // Move backward when deleting
        if value.isEmpty {
            if index > 0 {
                focusedIndex = index - 1
            }
        }
    }
}

#Preview {
    NavigationStack {
        OTPView()
    }
}

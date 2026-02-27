//
//  WithOTPView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 25/02/26.
//

import SwiftUI

struct WithOTPView: View {
    @Binding var mobNo: String
    let isShowRequiredImg: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 2) {
                Text("Mobile Number")
                    .padding(.top, 24)
                
                if isShowRequiredImg {
                    Image("required_img")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 8, height: 20)
                        .offset(y: 9)
                }
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
        }
    }
}

#Preview {
    WithOTPView(mobNo: .constant(""), isShowRequiredImg: true)
        .padding(.horizontal, 20)
}

//
//  TextFieldWithDropView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 16/03/26.
//

import SwiftUI

struct TextFieldWithDropView: View {
    @Binding var textFieldStr: String
    var isShowDropDown: Bool = true
    var isShowRequiredIcon: Bool = true
    var heading: String = "Test"
    var imageName: String = "ic_document"
    var placeholder: String = "Select Document"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 2) {
                Text(heading)
                    .padding(.top, 24)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color(hex: "353231"))
                
                if isShowRequiredIcon {
                    Image("required_img")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 8, height: 20)
                        .offset(y: 9)
                }
            }
            HStack {
                Image(imageName)
                TextField(placeholder, text: $textFieldStr)
                    .allowsHitTesting(!isShowDropDown)
                    .multilineTextAlignment(.leading)
                if isShowDropDown {
                    Image("ic-arrow-down")
                }
            }
            .padding(16)
            .overlay(
                RoundedCorner(radius: 12, corners: .allCorners)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .padding(.top, 4)
        }
    }
}

#Preview {
    TextFieldWithDropView(textFieldStr: .constant(""))
}

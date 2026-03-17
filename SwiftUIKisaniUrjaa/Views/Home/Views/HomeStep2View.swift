//
//  HomeStep2View.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 16/03/26.
//

import SwiftUI

struct StepViewDetailsModel: Identifiable, Hashable {
    let id = UUID()
    var isShowDropdown: Bool
    var isShowRequiredIcon: Bool
    var heading: String
    var imageName: String
    var placeholder: String
}

struct HomeStep2View: View {
    @State private var address: String = ""
    @State private var pincode: String = ""
    var showBottomPopup: (_ isDocSheet: Bool?, _ isKisaniSheet: Bool?) -> Void
    
    var step2Details: [StepViewDetailsModel] = [
        StepViewDetailsModel(isShowDropdown: false, isShowRequiredIcon: true, heading: "Pincode", imageName: "location_pin_img", placeholder: "Enter Pincode"),
        StepViewDetailsModel(isShowDropdown: false, isShowRequiredIcon: true, heading: "State", imageName: "state_img", placeholder: "State"),
        StepViewDetailsModel(isShowDropdown: true, isShowRequiredIcon: true, heading: "District", imageName: "state_img", placeholder: "District"),
        StepViewDetailsModel(isShowDropdown: true, isShowRequiredIcon: true, heading: "Mandal", imageName: "mandal_img", placeholder: "Select Mandal"),
        StepViewDetailsModel(isShowDropdown: true, isShowRequiredIcon: true, heading: "Village", imageName: "village_img", placeholder: "Select Village")
    ]
    
    func isMultiline(text: String, font: UIFont, width: CGFloat) -> Bool {
        let size = CGSize(width: width, height: .infinity)
        
        let attributes = [NSAttributedString.Key.font: font]
        
        let rect = NSString(string: text).boundingRect(
            with: size,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: attributes,
            context: nil
        )
        
        return rect.height > font.lineHeight
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Home Address Details")
                .padding(.top, 20)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(Color(hex: "161413"))
            
            HStack(spacing: 2) {
                Text("Complete Address")
                    .padding(.top, 24)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color(hex: "353231"))
                
                Image("required_img")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 8, height: 20)
                    .offset(y: 9)
            }
            
            GeometryReader { geo in
                let multiline = isMultiline(
                    text: address,
                    font: UIFont.systemFont(ofSize: 16, weight: .medium),
                    width: geo.size.width - 36
                )
                HStack(alignment: multiline ? .center : .top, spacing: 8) {
                    Image("location_marker_img")
                        .padding(.top, multiline ? 0 : 4)
                    
                    ZStack(alignment: .topLeading) {
                        if address.isEmpty {
                            Text("Enter Complete Address...")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundStyle(Color(hex: "857E7B"))
                                .padding(.top, 8)
                                .padding(.leading, 4)
                        }
                        TextEditor(text: $address)
                            .scrollContentBackground(.hidden)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color(hex: "353231"))
                    }
                    .frame(height: 50)
                }
                .frame(height: 50)
                .padding(14)
                .overlay {
                    RoundedCorner(radius: 12, corners: .allCorners)
                        .stroke(Color(hex: "E3E2E1"), lineWidth: 1)
                }
                .padding(.top, 4)
            }
            .frame(height: 74)
            
            ForEach(step2Details, id: \.self) { data in
                TextFieldWithDropView(textFieldStr: $pincode, isShowDropDown: data.isShowDropdown, isShowRequiredIcon: data.isShowRequiredIcon, heading: data.heading, imageName: data.imageName, placeholder: data.placeholder)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
}

#Preview {
    HomeStep2View { _, _ in
        
    }
}

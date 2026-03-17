//
//  HomeStep1View.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 16/03/26.
//

import SwiftUI

enum GenderType {
    case male
    case female
    case none
}

struct HomeStep1View: View {
    @State private var kisaniDidiStr: String = ""
    @Binding var isDocSelected: Bool
    @State private var genderType: GenderType = .none
    
    var showBottomPopup: (_ isDocSheet: Bool?, _ isKisaniSheet: Bool?) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("My Kisani Didi")
                .padding(.top, 20)
            
            Button {
                showBottomPopup(nil, true)
            } label: {
                HStack {
                    Image("homeDidi_img")
                    TextField("Select Kisani Didi", text: $kisaniDidiStr)
                        .allowsHitTesting(false)
                        .multilineTextAlignment(.leading)
                    Image("ic-arrow-down")
                }
                .padding(16)
                .overlay(
                    RoundedCorner(radius: 12, corners: .allCorners)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.top, 4)
            }
            
            HStack(spacing: 2) {
                Text("Profile Verification")
                    .font(.system(size: 14, weight: .bold))
                    .padding(.top, 24)
                
                Image("required_img")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 8, height: 20)
                    .offset(y: 9)
            }
            
            Text("Choose a Personal Identification document to upload. It will fill many details automatically.")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(Color(hex: "625D5B"))
                .padding(.top, 8)
            
            Button {
                showBottomPopup(true, nil)
            } label: {
                HStack {
                    Image("ic_document")
                    TextField("Select Document", text: $kisaniDidiStr)
                        .allowsHitTesting(false)
                        .multilineTextAlignment(.leading)
                    Image("ic-arrow-down")
                }
                .padding(16)
                .overlay(
                    RoundedCorner(radius: 12, corners: .allCorners)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.top, 4)
            }
            
            if isDocSelected {
                HStack(spacing: 8) {
                    ZStack(alignment: .topLeading) {
                        VStack(spacing: 0) {
                            Image("docSelection_img")
                            Text("Click here to Scan")
                                .font(Font.system(size: 12, weight: .semibold))
                                .foregroundStyle(Color(hex: "353231"))
                                .padding(.top, 6)
                            Text("Front Side of DL")
                                .font(Font.system(size: 10, weight: .medium))
                                .foregroundStyle(Color(hex: "857E7B"))
                                .padding(.top, 2)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(
                            RoundedCorner(radius: 12, corners: .allCorners)
                                .fill(Color(hex: "0A9B0C").opacity(0.19))
                        )
                        
                        Text("FRONT SIDE")
                            .font(Font.system(size: 10, weight: .semibold))
                            .foregroundStyle(Color(hex: "0A9B0C"))
                            .padding(.vertical, 4.5)
                            .padding(.horizontal, 7)
                            .background(
                                RoundedCorner(radius: 13, corners: [.topLeft, .bottomRight])
                                    .fill(.white)
                            )
                            .padding(2)
                    }
                    
                    ZStack(alignment: .topLeading) {
                        VStack(spacing: 0) {
                            Image("docSelection_img")
                            Text("Click here to Scan")
                                .font(Font.system(size: 12, weight: .semibold))
                                .foregroundStyle(Color(hex: "353231"))
                                .padding(.top, 6)
                            Text("Back Side of DL")
                                .font(Font.system(size: 10, weight: .medium))
                                .foregroundStyle(Color(hex: "857E7B"))
                                .padding(.top, 2)
                        }
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedCorner(radius: 12, corners: .allCorners)
                                .fill(Color(hex: "0A9B0C").opacity(0.19))
                        )
                        
                        Text("BACK SIDE")
                            .font(Font.system(size: 10, weight: .semibold))
                            .foregroundStyle(Color(hex: "0A9B0C"))
                            .padding(.vertical, 4.5)
                            .padding(.horizontal, 7)
                            .background(
                                RoundedCorner(radius: 13, corners: [.topLeft, .bottomRight])
                                    .fill(.white)
                            )
                            .padding(2)
                    }
                }
                .padding(.top, 16)
                
                HStack(spacing: 2) {
                    Text("ID Number")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.top, 24)
                    
                    Image("required_img")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 8, height: 20)
                        .offset(y: 9)
                }
                
                HStack {
                    Image("ic-idNum")
                    TextField("Enter ID Number", text: $kisaniDidiStr)
                        .allowsHitTesting(false)
                        .multilineTextAlignment(.leading)
                }
                .padding(16)
                .overlay(
                    RoundedCorner(radius: 12, corners: .allCorners)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.top, 4)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Farmer Details")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
                .background(
                    Color(hex: "DF8700").opacity(0.05)
                )
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 2) {
                    Text("Full Name")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.top, 24)
                    
                    Image("required_img")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 8, height: 20)
                        .offset(y: 9)
                    
                    Spacer()
                }
                
                HStack {
                    Image("ic-user")
                    TextField("Enter Full Name", text: $kisaniDidiStr)
                }
                .padding(16)
                .overlay(
                    RoundedCorner(radius: 12, corners: .allCorners)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.top, 4)
                
                HStack(spacing: 2) {
                    Text("Gender")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.top, 20)
                    
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    Button {
                        self.genderType = .male
                    } label: {
                        ZStack(alignment: .bottomTrailing) {
                            
                            VStack {
                                Spacer()
                                
                                HStack(spacing: 0) {
                                    Text("Male")
                                        .foregroundStyle(Color(hex: "353231"))
                                    Spacer()
                                }
                                .padding(.horizontal, 10)
                                
                                Spacer()
                            }
                            
                            Image("male_home")
                                .clipped()
                        }
                        .frame(height: 52)
                        .contentShape(Rectangle())
                        .background(
                            genderType == .male ? Color(hex: "7ABA3D").opacity(0.08) : .clear
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedCorner(radius: 12, corners: .allCorners)
                                .stroke(self.genderType == .male ? Color(hex: "5EA21F") : Color.gray.opacity(0.5), lineWidth: 1)
                                .shadow(color: Color(hex: "5EA21F").opacity(self.genderType == .male ? 0.15 : 0), radius: 10, x: 0, y: 4)
                        )
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        self.genderType = .female
                    } label: {
                        ZStack(alignment: .bottomTrailing) {
                            VStack {
                                Spacer()
                                
                                HStack(spacing: 0) {
                                    Text("Female")
                                        .foregroundStyle(Color(hex: "353231"))
                                    Spacer()
                                }
                                .padding(.horizontal, 10)
                                
                                Spacer()
                            }
                            
                            Image("female_home")
                                .scaledToFill()
                        }
                        .frame(height: 52)
                        .contentShape(Rectangle())
                        .background(
                            genderType == .female ? Color(hex: "7ABA3D").opacity(0.08) : .clear
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedCorner(radius: 12, corners: .allCorners)
                                .stroke(self.genderType == .female ? Color(hex: "5EA21F") : Color.gray.opacity(0.5), lineWidth: 1)
                                .shadow(color: Color(hex: "5EA21F").opacity(self.genderType == .female ? 0.15 : 0), radius: 10, x: 0, y: 4)
                        )
                    }
                    .buttonStyle(.plain)
                }
                .padding(.top, 8)
                
                HStack(spacing: 2) {
                    Text("Date of Birth")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.top, 20)
                    
                    Spacer()
                }
                
                HStack {
                    Image("ic_calendar")
                    TextField("DD/MM/YY", text: $kisaniDidiStr)
                }
                .padding(16)
                .overlay(
                    RoundedCorner(radius: 12, corners: .allCorners)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.top, 4)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedCorner(radius: 12, corners: .allCorners)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.top, 28)
    }
}

#Preview {
    HomeStep1View(isDocSelected: .constant(false)) { _, _ in
        
    }
}

//
//  HomeStep3View.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 16/04/26.
//

import SwiftUI

struct HomeStep3View: View {
    @State private var showTooltip = false
    @State private var isFatherSelected: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(spacing: 8) {
                ZStack(alignment: .bottomTrailing) {
                    Image("homeUser")
                        .padding(.vertical, 26)
                        .padding(.horizontal, 29)
                        .background(
                            Circle()
                                .fill(Color(hex: "EFEFEF"))
                        )
                    
                    VStack {
                        Image("homeCamera")
                            .padding(10)
                            .background(
                                Circle()
                                    .fill(Color(hex: "FC8019"))
                                    .stroke(Color(hex: "FFFFFF"), lineWidth: 2)
                            )
                    }
                    .offset(x: 4, y: 4)
                }
                Text("Upload Profile Photo")
                    .foregroundStyle(Color(hex: "625D5B"))
                    .font(.system(size: 14, weight: .medium))
            }
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
            .background(
                RoundedCorner(radius: 24, corners: .allCorners)
                    .fill(Color(hex: "FFFFFF"))
                    .stroke(Color(hex: "000000").opacity(0.18), lineWidth: 1)
            )
            
            VStack(alignment: .leading, spacing: 0) {
                VStack() {
                    Text("Additional Details")
                        .padding(.vertical, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color(hex: "DF8700"))
                        .clipped()
                }
                .background(Color(hex: "DF8700").opacity(0.05))
                
                HStack(spacing: 27) {
                    Button {
                        isFatherSelected = true
                    } label: {
                        HStack(spacing: 6) {
                            Image(isFatherSelected ? "homeRadioSelection" : "homeRadioUnselection")
                            Text("Father Name")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(Color(hex: "353231"))
                        }
                    }
                    
                    Button {
                        isFatherSelected = false
                    } label: {
                        HStack(spacing: 6) {
                            Image(isFatherSelected ? "homeRadioUnselection" : "homeRadioSelection")
                            Text("Spouse Name")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(Color(hex: "353231"))
                        }
                    }
                }
                .padding(.top, 22)
                .padding(.horizontal, 16)
                
                VStack {
                    HStack(spacing: 8) {
                        Image("homeInputUser")
                        TextField("Enter \(isFatherSelected ? "Father" : "Spouse") Name", text: .constant(""))
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color(hex: "353231"))
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 14)
                    .background(
                        RoundedCorner(radius: 12, corners: .allCorners)
                            .stroke(Color(hex: "E3E2E1"), lineWidth: 1)
                    )
                    .padding(.top, 12)
                    
                    HStack(spacing: 0) {
                        Text("Alternate Mobile Number")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color(hex: "353231"))
                        Spacer()
                        Button {
                            withAnimation {
                                showTooltip.toggle()
                            }
                        } label: {
                            Image("info_img")
                                .renderingMode(.template)
                                .foregroundStyle(Color(hex: "FC8019"))
                        }
                    }
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .bottomTrailing) {
                        if showTooltip {
                            TooltipView(text: "You can also add a family member’s Mobile Number.")
                                .offset(x: 10, y: -20)
                        }
                    }
                    
                    HStack(spacing: 8) {
                        Image("homePhone")
                        TextField("Enter Mobile Number", text: .constant(""))
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color(hex: "353231"))
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 14)
                    .background(
                        RoundedCorner(radius: 12, corners: .allCorners)
                            .stroke(Color(hex: "E3E2E1"), lineWidth: 1)
                    )
                    
                    HStack {
                        Text("Email ID")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color(hex: "353231"))
                        Spacer()
                    }
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity)
                    
                    HStack(spacing: 8) {
                        Image("homeEmail")
                        TextField("Enter Email ID", text: .constant(""))
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color(hex: "353231"))
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 14)
                    .background(
                        RoundedCorner(radius: 12, corners: .allCorners)
                            .stroke(Color(hex: "E3E2E1"), lineWidth: 1)
                    )
                }
                .padding(.horizontal, 16)
                
                HStack() {
                    Text("Educational Details")
                        .padding(.vertical, 16)
                        .padding(.leading, 16)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color(hex: "DF8700"))
                    
                    Spacer()
                }
                .background(Color(hex: "DF8700").opacity(0.05))
                .padding(.top, 28)
                
                HStack {
                    Text("Highest Education")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color(hex: "353231"))
                    Spacer()
                }
                .padding(.top, 20)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                
                HStack(spacing: 8) {
                    Image("homeQualification")
                    TextField("Select Education Level", text: .constant(""))
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color(hex: "353231"))
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 14)
                .background(
                    RoundedCorner(radius: 12, corners: .allCorners)
                        .stroke(Color(hex: "E3E2E1"), lineWidth: 1)
                )
                .padding(.top, 4)
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
            .frame(maxWidth: .infinity)
            .background(
                RoundedCorner(radius: 24, corners: .allCorners)
                    .fill(Color(hex: "FFFFFF"))
            )
            .overlay(
                RoundedCorner(radius: 24, corners: .allCorners)
                    .stroke(Color(hex: "000000").opacity(0.18), lineWidth: 1)
            )
            .clipShape(RoundedCorner(radius: 24, corners: .allCorners))
            .padding(.top, 20)
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }
}

#Preview {
    HomeStep3View()
}

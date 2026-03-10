//
//  HomeView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 27/02/26.
//

import SwiftUI

struct HomeView: View {
    @State private var kisaniDidiStr: String = ""
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                Image("homeTopBg_img")
                    .resizable()
                    .scaledToFit()
                
                VStack(spacing: 0) {
                    Text("Profile Details")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(Color(hex: "161413"))
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(alignment: .lastTextBaseline, spacing: 6) {
                            Text("20%")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(Color(hex: "171D25"))
                            
                            Text("Profile Complete")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundStyle(Color(hex: "857E7B"))
                            
                            Spacer()
                        }
                        
                        HStack(alignment: .lastTextBaseline, spacing: 6) {
                            Text("Personal Details")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(Color(hex: "353231"))
                            
                            Spacer()
                            
                            Text("(1/3 Steps)")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundStyle(.black.opacity(0.5))
                        }
                        .padding(.top, 12)
                        
                        SegmentedProgressView(totalSteps: 3, currentStep: 0)
                            .padding(.top, 12)
                    }
                    .padding(16)
                    .background(
                        RoundedCorner(radius: 16, corners: .allCorners)
                            .fill(.white)
                    )
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                }
                .padding(.bottom, 18)
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("My Kisani Didi")
                        .padding(.top, 20)
                    
                    HStack {
                        Image("homeDidi_img")
                        TextField("Select Kisani Didi", text: $kisaniDidiStr)
                        Image("ic-arrow-down")
                    }
                    .padding(16)
                    .overlay(
                        RoundedCorner(radius: 12, corners: .allCorners)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.top, 4)
                    
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
                    
                    HStack {
                        Image("homeDidi_img")
                        TextField("Select Document", text: $kisaniDidiStr)
                        Image("ic-arrow-down")
                    }
                    .padding(16)
                    .overlay(
                        RoundedCorner(radius: 12, corners: .allCorners)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.top, 12)
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
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedCorner(radius: 12, corners: .allCorners)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )

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
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedCorner(radius: 12, corners: .allCorners)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
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
                
                Button("Continue") {
                    
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .padding(.vertical, 17)
                .background(
                    Color(red: 252/255, green: 128/255, blue: 25/255)
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
                .padding(.horizontal, 16)
                .padding(.top, 60)
                .padding(.bottom, 20)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}

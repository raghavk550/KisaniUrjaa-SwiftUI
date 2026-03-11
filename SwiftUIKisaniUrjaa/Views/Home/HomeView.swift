//
//  HomeView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 27/02/26.
//

import SwiftUI

enum GenderType {
    case male
    case female
    case none
}

struct HomeView: View {
    @State private var kisaniDidiStr: String = ""
    @State private var showKisaniDidiSheet = false
    @State private var showDocSheet = false
    @State private var contentHeight: CGFloat = .zero
    @State private var docContentHeight: CGFloat = .zero
    let maxHeightFraction: CGFloat = 0.7
    @State private var isDocSelected: Bool = false
    @State private var genderType: GenderType = .none
    @State private var currentStep: Int = 0
    @State private var currentPercent: Int = 20
    
    var body: some View {
        GeometryReader { geo in
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
                                Text("\(currentPercent)%")
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
                                
                                Text("(\(self.currentStep + 1)/3 Steps)")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(.black.opacity(0.5))
                            }
                            .padding(.top, 12)
                            
                            SegmentedProgressView(totalSteps: 3, progress: CGFloat(self.currentPercent) / 100)
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
                        
                        Button {
                            showKisaniDidiSheet = true
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
                            showDocSheet = true
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
                    
                    Button("Continue") {
                        if currentStep < 3 {
                            self.currentStep += 1
                        }
                        switch currentStep {
                        case 1:
                            self.currentPercent = 40
                        case 2:
                            self.currentPercent = 70
                        case 3:
                            self.currentPercent = 80
                        default:
                            self.currentPercent = 100
                        }
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
            .sheet(isPresented: $showKisaniDidiSheet) {
                // Sheet Content
                SelectKisaniDidiPopupView2(idTxt: .constant(""), contentHeight: $contentHeight)
                    .presentationDetents([.height(min(contentHeight, geo.size.height * maxHeightFraction))])
                    .presentationDragIndicator(.visible)
                    .presentationBackground(Color.white)
            }
            .sheet(isPresented: $showDocSheet) {
                // Sheet Content
                SelectDocumentPopupView(contentHeight: $docContentHeight) {
                    showDocSheet = false
                    isDocSelected = true
                }
                .onAppear {
                    isDocSelected = false
                }
                .presentationDetents([.height(min(docContentHeight, geo.size.height * maxHeightFraction))])
                .presentationDragIndicator(.visible)
                .presentationBackground(Color.white)
            }
        }
//        .sheet(isPresented: $showKisaniDidiSheet) {
//            SelectKisaniDidiPopupView(idTxt: .constant(""))
//                .presentationDetents([.medium])
//                .presentationDragIndicator(.visible)
//                .presentationBackground(Color.white)
//        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}

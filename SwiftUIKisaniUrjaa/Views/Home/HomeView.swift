//
//  HomeView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 27/02/26.
//

import SwiftUI

struct HomeView: View {
    @State private var showKisaniDidiSheet = false
    @State private var showDocSheet = false
    @State private var contentHeight: CGFloat = .zero
    @State private var docContentHeight: CGFloat = .zero
    let maxHeightFraction: CGFloat = 0.7
    @State private var isDocSelected: Bool = false
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
                                
                                Text("(\(self.currentStep + 1 >= 3 ? 3 : self.currentStep + 1)/3 Steps)")
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
                    
                    switch currentStep {
                    case 0:
                        HomeStep1View(isDocSelected: $isDocSelected) { isShowDocSheet, isShowKisaniDidiSheet in
                            if let isShowDocSheet {
                                self.showDocSheet = isShowDocSheet
                            }
                            if let isShowKisaniDidiSheet {
                                self.showKisaniDidiSheet = isShowKisaniDidiSheet
                            }
                        }
                    case 1:
                        HomeStep2View { isDocSheet, isKisaniSheet in
                            
                        }
                    default:
                        EmptyView()
                    }
                    
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

//
//  CustomBottomTabBar.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 17/04/26.
//

import SwiftUI

struct BottomTabBar: View {
    @Binding var selectedTab: MainHomeView.Tab
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // background to help visualise the bar
            Color(.systemGray6).ignoresSafeArea()
            
            // Main content area
            VStack {
                Spacer()
                
                if selectedTab == .home {
                    VStack {
                        Text("Home")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                } else {
                    VStack {
                        Text("Account")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                }
            }
            
            Spacer()
            
            // Bottom custom tab bar
            VStack {
                Spacer()
                CustomBottomTabBar(selectedTab: $selectedTab)
            }
        }
    }
}


struct CustomBottomTabBar: View {
    @Binding var selectedTab: MainHomeView.Tab
    
    // Tuned metrics to better match the Figma
    private let barHeight: CGFloat = 78
    private let barCornerRadius: CGFloat = 30
    private let fabSize: CGFloat = 68
    private let fabBackingSize: CGFloat = 82
    private let fabOffset: CGFloat = -34
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // subtle drop shadow background for the bar (gives the lifted look)
                RoundedRectangle(cornerRadius: barCornerRadius + 2, style: .continuous)
                    .fill(Color(.systemGray6))
                    .frame(height: barHeight + 10)
                    .padding(.horizontal, 12)
                    .offset(y: 8)
                
                // Rounded white bar
                RoundedRectangle(cornerRadius: barCornerRadius, style: .continuous)
                    .fill(Color.white)
                    .frame(height: barHeight)
                    .shadow(color: Color.black.opacity(0.12), radius: 12, x: 0, y: 6)
                    .padding(.horizontal, 12)
                
                // Tab buttons (space left for center FAB)
                HStack(alignment: .center) {
                    TabBarButtonView(icon: "house.fill", title: "Home", isSelected: selectedTab == .home) {
                        withAnimation(.spring(response: 0.28, dampingFraction: 0.7)) {
                            selectedTab = .home
                        }
                    }
                    
                    Spacer(minLength: geo.size.width * 0.22)
                    
                    TabBarButtonView(icon: "account_avatar", title: "Account", isSelected: selectedTab == .account) {
                        withAnimation(.spring(response: 0.28, dampingFraction: 0.7)) {
                            selectedTab = .account
                        }
                    }
                }
                .frame(height: barHeight)
                .padding(.bottom, 6)
                
                // white circular background behind the FAB to create the notch/ring effect
                Circle()
                    .fill(Color.white)
                    .frame(width: fabBackingSize, height: fabBackingSize)
                    .shadow(color: Color.black.opacity(0.08), radius: 6, x: 0, y: 4)
                    .offset(y: fabOffset)
                
                // Floating center button (FAB)
                Button(action: {
                    // center action
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.orange)
                            .frame(width: fabSize, height: fabSize)
                            .shadow(color: Color.black.opacity(0.26), radius: 10, x: 0, y: 6)
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                    }
                }
                // lift it up to overlap the top of the rounded bar
                .offset(y: fabOffset)
            }
            // ensure we leave space for devices with home indicator
            .padding(.bottom, 0)
        }
        .frame(height: 150)
    }
}


struct TabBarButtonView: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: ()->Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                if icon == "house.fill" {
                    // small orange rounded background behind the house icon (closer to Figma)
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(isSelected ? Color.orange : Color.orange.opacity(0.12))
                            .frame(width: 40, height: 30)
                            .scaleEffect(isSelected ? 1.02 : 1)
                        
                        Image(systemName: "house.fill")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(isSelected ? Color.white : Color.orange)
                            .scaleEffect(isSelected ? 1.05 : 1)
                    }
                    .padding(.top, isSelected ? 4 : 6)
                    .animation(.easeInOut(duration: 0.18), value: isSelected)
                } else if icon == "account_avatar" {
                    // avatar circle for Account - try common asset names, fallback to system icon
                    Group {
                        if let uiImage = UIImage(named: "account_avatar") ?? UIImage(named: "profile_avatar") ?? UIImage(named: "avatar") {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 36, height: 36)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 0))
                                .scaleEffect(isSelected ? 1.03 : 1)
                        } else {
                            ZStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.12))
                                    .frame(width: 36, height: 36)
                                Image(systemName: "person.crop.circle.fill")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color.gray)
                            }
                            .scaleEffect(isSelected ? 1.03 : 1)
                        }
                    }
                    .padding(.top, 6)
                    .animation(.easeInOut(duration: 0.18), value: isSelected)
                } else {
                    Image(systemName: icon)
                        .font(.system(size: 22))
                        .foregroundColor(isSelected ? Color.orange : Color.gray)
                }
                
                Text(title)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(isSelected ? Color.orange : Color.gray)
                    .offset(y: isSelected ? 0 : 0)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    NavigationStack {
        BottomTabBar(selectedTab: .constant(.home))
    }
}

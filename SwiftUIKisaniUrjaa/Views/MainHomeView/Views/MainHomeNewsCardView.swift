//
//  MainHomeNewsCardView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 20/04/26.
//

import SwiftUI

struct MainHomeNewsCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("logo_img")
                .frame(height: 128)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedCorner(radius: 10, corners: .allCorners)
                        .fill(Color(hex: "E0E0E0"))
                )
            
            Text("Crop-residue burning turning India into global methane hotspot, UN...")
                .padding(.top, 6)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color(hex: "353231"))
                .fixedSize(horizontal: false, vertical: true)
            
            Text("India has emerged as a global hotspot for methane emissions from crop-residue burning, according to a United Nations report released...")
                .padding(.top, 4)
                .font(.system(size: 10, weight: .regular))
                .foregroundStyle(Color(hex: "625D5B"))
                .fixedSize(horizontal: false, vertical: true)
            
            HStack(spacing: 8) {
                Image("ic_calendar")
                
                Text("15 Nov, 2025 at 2:00 PM")
                    .font(.system(size: 10, weight: .regular))
                    .foregroundStyle(Color(hex: "353231"))
            }
            .padding(.top, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(8)
        .padding(.bottom, 2)
        .background(
            RoundedCorner(radius: 16, corners: .allCorners)
                .fill(.white)
        )
    }
}

#Preview {
    MainHomeNewsCardView()
}

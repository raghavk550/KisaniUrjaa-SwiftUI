//
//  LocationPermissionView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 09/02/26.
//

import SwiftUI

struct LocationPermissionView: View {
    let closeView: () -> Void
    let locationSelected: () -> Void
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(red: 22/255, green: 20/255, blue: 19/255, opacity: 0.88)
                
                VStack(spacing: 0) {
                    Image("location_img")
                    
                    Text("Location Permissions")
                        .padding(.top, 14)
                    
                    Text("Allow Gruner Social to access your device location?")
                        .padding(.top, 8)
                        .multilineTextAlignment(.center)
                    
                    Button {
                        locationSelected()
                    } label: {
                        Text("While using the app")
                            .foregroundStyle(Color(red: 252/255, green: 128/255, blue: 25/255))
                            .frame(height: 52)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedCorner(radius: 12, corners: .allCorners)
                                    .fill(Color.white)
                            )
                            .overlay(
                                RoundedCorner(radius: 12, corners: .allCorners)
                                    .stroke(Color(red: 252/255, green: 128/255, blue: 25/255), lineWidth: 1)
                            )
                    }
                    .padding(.top, 16)
                    
                    Button {
                        locationSelected()
                    } label: {
                        Text("Only this time")
                            .foregroundStyle(Color(red: 252/255, green: 128/255, blue: 25/255))
                            .frame(height: 52)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedCorner(radius: 12, corners: .allCorners)
                                    .fill(Color.white)
                            )
                            .overlay(
                                RoundedCorner(radius: 12, corners: .allCorners)
                                    .stroke(Color(red: 252/255, green: 128/255, blue: 25/255), lineWidth: 1)
                            )
                    }
                    .padding(.top, 16)
                    
                    Button {
                        
                    } label: {
                        Text("Don't allow")
                            .foregroundStyle(Color(red: 252/255, green: 128/255, blue: 25/255))
                            .frame(height: 52)
                    }
                    .padding(.top, 16)
                }
                .padding(24)
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color.white)
                )
                .padding(.horizontal, 24)
            }
            .ignoresSafeArea()
            .onTapGesture {
                closeView()
            }
        }
    }
}

#Preview {
    LocationPermissionView {
        
    } locationSelected: {
        
    }
}

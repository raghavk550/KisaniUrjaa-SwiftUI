//
//  ChooseLanguageView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 04/02/26.
//

import SwiftUI

struct ChooseLanguageView: View {
    @State private var showSheet = false
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("chooseLangBg_img")
                    .resizable()
                
                ChooseLangInnerView() {
                    showSheet = true
                }
                .fullScreenCover(isPresented: $showSheet) {
                    LocationPermissionView {
                        showSheet = false
                    } locationSelected: {
                        appState.root = .setupAccount
                    }
                }
                .frame(height: geo.size.height * 0.82)
                .background(
                    
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 24)
                )
                .padding(.horizontal, 16)
            }
            .ignoresSafeArea()
        }
        .onAppear {
            let deviceLanguageCode = Locale.preferredLanguages.first
            print(deviceLanguageCode ?? "unknown")
        }
    }
}

#Preview {
    ChooseLanguageView()
}

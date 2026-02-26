//
//  ChooseLangInnerView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 04/02/26.
//

import SwiftUI

struct ChooseLangInnerView: View {
    @State private var selectedIndex: Int = 0
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    let languages: [LanguageModel] = [
        LanguageModel(name: "English", isDeviceLanguage: true),
        LanguageModel(name: "हिंदी", isDeviceLanguage: false),
        LanguageModel(name: "ਪੰਜਾਬੀ", isDeviceLanguage: false),
        LanguageModel(name: "ગુજરાતી", isDeviceLanguage: false),
        LanguageModel(name: "मराठी", isDeviceLanguage: false),
        LanguageModel(name: "తెలుగు", isDeviceLanguage: false),
        LanguageModel(name: "ఒరియా", isDeviceLanguage: false)
    ]
    
    let onContinue: () -> Void
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center, spacing: 24) {
                HStack {
                    Text("Choose your language")
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 20)
                    
                    Spacer()
                }
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(0..<languages.count, id: \.self) { index in
                            let isSelected = selectedIndex == index
                            // Radio + Title
                            ZStack(alignment: .bottomTrailing) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Device Language")
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .foregroundStyle(.black)
                                        .padding(.vertical, 5)
                                        .background(
                                            Color(red: 254/255, green: 227/255, blue: 205/255)
                                        )
                                        .clipShape(
                                            UnevenRoundedRectangle(
                                                topLeft: 12,
                                                topRight: 12,
                                                bottomLeft: 3,
                                                bottomRight: 3
                                            )
                                        )
                                        .opacity(languages[index].isDeviceLanguage ? 1 : 0)
                                    
                                    HStack(spacing: 12) {
                                        Image(isSelected ? "langSelected_img" : "langUnselected_img")
                                        Text(languages[index].name)
                                            .font(.system(size: 18, weight: .medium))
                                        Spacer()
                                    }
                                    .padding(.horizontal, 10)
                                    
                                    Spacer()
                                }
                                .frame(height: 105)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                                )
                                
                                Image("lang\(index + 1)")
                            }
                            .onTapGesture {
                                selectedIndex = index
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                Button("Continue") {
                    onContinue()
                }
                .frame(width: geo.size.width - 40)
                .foregroundStyle(.white)
                .padding(.vertical, 17)
                .background(
                    Color(red: 252/255, green: 128/255, blue: 25/255)
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            }
            .frame(width: geo.size.width)
            .padding(.vertical, 24)
        }
    }
}

#Preview {
    ChooseLangInnerView {
        
    }
}

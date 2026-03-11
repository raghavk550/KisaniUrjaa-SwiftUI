//
//  SelectDocumentPopupView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 11/03/26.
//

import SwiftUI

struct SelectDocumentPopupView: View {
    @Binding var contentHeight: CGFloat
    private let numberOfRows: Int = 4
    
    let docSelected: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Title
            Text("Select Document")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(Color(hex: "161413"))
            
            // Search field
            Text("Choose a KYC document to upload. It will fill many details automatically.")
                .padding(.top, 8)
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(Color(hex: "625D5B"))
            
            // List
            ScrollView(showsIndicators: false) {
                
                LazyVStack(spacing: 24) {
                    
                    ForEach(0...(numberOfRows - 1), id: \.self) { _ in
                        HStack {
                            Text("Voter ID")
                            
                            Spacer()
                            
                            Button("Select") {
                                docSelected()
                            }
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(Color(hex: "FC8019"))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(hex: "FC8019"), lineWidth: 1)
                            )
                        }
                    }
                    
                }
                .padding(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hex: "000000").opacity(0.1), lineWidth: 1)
                )
                .padding(.top, 16)
                .padding(.bottom, 10)
                .measureHeight(to: $contentHeight, with: numberOfRows - 1, minusHeight: 120)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }
}

#Preview {
    SelectDocumentPopupView(contentHeight: .constant(300)) {
        
    }
}

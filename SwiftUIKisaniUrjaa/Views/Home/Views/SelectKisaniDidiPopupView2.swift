//
//  SelectKisaniDidiPopupView 2.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 11/03/26.
//

import SwiftUI

struct SelectKisaniDidiPopupView2: View {
    
    @Binding var idTxt: String
    @Binding var contentHeight: CGFloat
    private let numberOfRows: Int = 3
    var body: some View {
        
        VStack(spacing: 0) {
            
            // Title
            Text("Select Kisani Didi")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(Color(hex: "161413"))
            
            // Search field
            TextField("Search by ID", text: $idTxt)
                .padding(.vertical, 18)
                .padding(.horizontal, 14)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "A7A2A0"), lineWidth: 1)
                )
                .padding(.top, 16)
            
            // List
            ScrollView(showsIndicators: false) {
                
                LazyVStack(spacing: 12) {
                    
                    ForEach(0...(numberOfRows - 1), id: \.self) { _ in
                        cell
                    }
                    
                }
                .padding(.top, 16)
                .padding(.bottom, 10)
                .measureHeight(to: $contentHeight, with: numberOfRows, minusHeight: 120)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }
    
    
    // MARK: Cell
    
    var cell: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 4) {
                
                HStack(spacing: 8) {
                    Text("Namita Devi")
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text("#KD00001")
                        .font(.system(size: 8, weight: .semibold))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(hex: "FFD21E"))
                        )
                }
                
                Text("+91 09876543210")
                    .font(.system(size: 12))
                
                Text("Ratnapur, Maharashtra")
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            Button("Select") { }
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(hex: "FC8019"))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: "FC8019"), lineWidth: 1)
                )
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(hex: "F3F3F3"))
        )
    }
}

#Preview {
    SelectKisaniDidiPopupView2(idTxt: .constant(""), contentHeight: .constant(300))
}

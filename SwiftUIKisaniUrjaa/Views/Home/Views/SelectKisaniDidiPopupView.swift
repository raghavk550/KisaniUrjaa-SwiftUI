//
//  SelectKisaniDidiPopupView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 11/03/26.
//

import SwiftUI

struct SelectKisaniDidiPopupView: View {
    @Binding var idTxt: String
    var body: some View {
        VStack(spacing: 0) {
            Text("Select Kisani Didi")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(Color(hex: "161413"))
            
            TextField("Search by ID", text: $idTxt)
                .padding(.vertical, 18)
                .padding(.horizontal, 14)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "A7A2A0"), lineWidth: 1)
                )
                .padding(.top, 16)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 12) {
                    ForEach(1...5, id: \.self) { index in
                        
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
            }
            .padding(.vertical, 16)
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }
}

#Preview {
    SelectKisaniDidiPopupView(idTxt: .constant(""))
}

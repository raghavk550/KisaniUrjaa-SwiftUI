//
//  TooltipView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 24/02/26.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct TooltipView: View {
    var text: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Text(text)
                .font(.footnote)
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 4)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.black.opacity(0.85))
                )
            Triangle()
                .fill(Color.black.opacity(0.85))
                .frame(width: 14, height: 8)
                .padding(.trailing, 10)
        }
    }
}

#Preview {
    TooltipView(text: "Hello World, Hello World, Hello World, Hello World, Hello World")
}

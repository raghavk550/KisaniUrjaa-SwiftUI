//
//  SegmentedProgressView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 09/03/26.
//

import SwiftUI

struct SegmentedProgressView: View {
    
    var totalSteps: Int = 3
    var progress: CGFloat = 0.4
    
    var body: some View {
        HStack(spacing: 8) {
            
            ForEach(0..<totalSteps, id: \.self) { index in
                
                GeometryReader { geo in
                    
                    let segmentSize = 1 / CGFloat(totalSteps)
                    let segmentStart = CGFloat(index) * segmentSize
                    let segmentProgress = max(0, min(1, (progress - segmentStart) / segmentSize))
                    
                    ZStack(alignment: .leading) {
                        
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.gray.opacity(0.3))
                        
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.orange)
                            .frame(width: geo.size.width * segmentProgress)
                    }
                }
                .frame(height: 6)
            }
        }
        .frame(height: 6)
    }
}

#Preview {
    SegmentedProgressView(
        totalSteps: 3,
        progress: 0.3
    )
    .padding(.horizontal, 16)
}

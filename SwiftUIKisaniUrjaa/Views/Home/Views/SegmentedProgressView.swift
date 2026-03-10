//
//  SegmentedProgressView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 09/03/26.
//

import SwiftUI

struct SegmentedProgressView: View {
    
    var totalSteps: Int = 3
    var currentStep: Int = 1
    var progress: CGFloat = 0.4   // progress inside current step (0–1)
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalSteps, id: \.self) { index in
                
                GeometryReader { geo in
                    
                    ZStack(alignment: .leading) {
                        
                        // Background
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.gray.opacity(0.3))
                        
                        // Filled
                        if index < currentStep {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.orange)
                        }
                        
                        // Current step progress
                        if index == currentStep {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.orange)
                                .frame(width: geo.size.width * progress)
                        }
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
        currentStep: 0,
        progress: 0.5
    )
    .padding(.horizontal, 16)
}

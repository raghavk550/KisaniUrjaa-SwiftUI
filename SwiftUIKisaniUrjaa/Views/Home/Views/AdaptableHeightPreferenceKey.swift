//
//  AdaptableHeightPreferenceKey.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 11/03/26.
//

import SwiftUI

struct AdaptableHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat?

    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
}

struct AdaptableHeightModifier: ViewModifier {
    @Binding var currentHeight: CGFloat
    var numberOfItems: CGFloat
    var minusHeight: CGFloat = 0

    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: AdaptableHeightPreferenceKey.self, value: geometry.size.height)
        }
    }

    func body(content: Content) -> some View {
        content
            .background(sizeView)
            .onPreferenceChange(AdaptableHeightPreferenceKey.self) { height in
                if let height {
                    currentHeight = (height * numberOfItems) - ((numberOfItems - 1) * minusHeight)
                }
            }
    }
}

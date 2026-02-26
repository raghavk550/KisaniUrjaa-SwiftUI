//
//  SplashView1.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 02/02/26.
//

import SwiftUI
import AVKit

struct SplashView1: View {
    @EnvironmentObject var appState: AppState
    private let height: CGFloat = 64
    private let knobSize: CGFloat = 48
    
    @State private var dragOffset: CGFloat = 0
    @State private var isCompleted = false
    @State private var player = AVPlayer()
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                VideoPlayer(player: player)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
            }
            VStack {
                GeometryReader { geo in
                    ZStack(alignment: .top) {
                        LinearGradient(colors: [.white, .clear], startPoint: .top, endPoint: .bottom)
                        Image("logo_img")
                            .padding(.top, 60)
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.5)
                }
                Spacer()
                
                GeometryReader { geo in
                    let width = geo.size.width
                    ZStack {
                        // Background
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.ultraThinMaterial)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.black.opacity(0.25))
                            )
                            .allowsHitTesting(false)
                        
//                        // Progress fill
//                        HStack {
//                            RoundedRectangle(cornerRadius: 16)
//                                .fill(Color.orange.opacity(0.9))
//                                .frame(width: dragOffset + knobSize + 8)
//                            Spacer()
//                        }
//                        .animation(.easeOut(duration: 0.2), value: dragOffset)
                        
                        // Center text
                        Text("Get Started")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)
                            .opacity(isCompleted ? 0.7 : 1)
                            .allowsHitTesting(false)
                        
                        // Draggable knob
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.orange)
                            }
                            .frame(width: knobSize, height: knobSize)
                            .offset(x: dragOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        let newOffset = max(0, min(value.translation.width, width - knobSize - 8))
                                        dragOffset = newOffset
                                    }
                                    .onEnded { _ in
                                        let successPoint = (width - knobSize) * 0.85
                                        
                                        if dragOffset >= successPoint {
                                            complete()
                                        } else {
                                            reset()
                                        }
                                    }
                            )
                            Spacer()
                        }
                        .padding(.horizontal, 6)
                    }
                    .frame(width: width, height: height)
                }
                .frame(height: height)
                .padding(.bottom, 40)
                .padding(.horizontal, 20)
            }
            .ignoresSafeArea()
        }
        .background(.clear)
        .ignoresSafeArea()
        .onAppear {
            if player.currentItem == nil {
                let url = Bundle.main.url(forResource: "bgVid", withExtension: "mp4")!
                player.replaceCurrentItem(with: AVPlayerItem(url: url))
                player.play()
            }
        }
        .onReceive(NotificationCenter.default.publisher(
            for: .AVPlayerItemDidPlayToEndTime
        )) { _ in
            player.seek(to: .zero)
            player.play()
        }
    }
    
    // MARK: - Actions
    
    private func complete() {
        withAnimation(.spring()) {
            dragOffset = 0//width - knobSize - 8
            isCompleted = true
        }
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        appState.root = .language
    }
    
    private func reset() {
        withAnimation(.spring()) {
            dragOffset = 0
        }
    }
}

#Preview {
    SplashView1()
        .environmentObject(AppState())
}

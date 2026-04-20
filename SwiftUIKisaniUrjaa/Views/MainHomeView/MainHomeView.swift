//
//  MainHomeView.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 17/04/26.
//

import SwiftUI

struct MainHomeView: View {
    enum Tab {
        case home, account
    }
    
    @State private var selectedTab: Tab = .home
    @State private var cardHeight: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                LinearGradient(colors: [Color(hex: "ACD2D6"), Color(hex: "AEE5BE")], startPoint: .leading, endPoint: .trailing)
                    .clipShape(RoundedCorner(radius: 24, corners: [.bottomLeft, .bottomRight]))
                    .frame(height: 250)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Good Morning, Ram Prasad")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(Color(hex: "353231"))
                            
                            Text("Tuesday, 23 Sep 2025")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundStyle(Color(hex: "625D5B"))
                        }
                        
                        Spacer()
                        
                        Image("home_notif")
                    }
                    
                    Text("Today's Weather")
                        .padding(.top, 21)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color(hex: "353231"))
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Spacer()
                            Image("accuweather")
                        }
                        .padding(.top, 12)
                        .padding(.horizontal, 16)
                        
                        HStack {
                            VStack(spacing: 0) {
                                VStack(alignment: .leading, spacing: 0) {
                                    HStack(spacing: 8) {
                                        Image("homeLocation")
                                        Text("Ratanpur, Buldhana")
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundStyle(Color(hex: "000000"))
                                        
                                        Spacer()
                                    }
                                    .padding(.top, 2)
                                    
                                    Text("32°")
                                        .padding(.top, 24)
                                        .font(.system(size: 48, weight: .bold))
                                        .foregroundStyle(Color(hex: "7B3C0C"))
                                    
                                    Text("Party Cloudy")
                                        .padding(.top, 6)
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundStyle(Color(hex: "353231"))
                                }
                            }
                            .padding(.horizontal, 16)
                            
                            Image("weatherDetail")
                                .padding(.trailing, 16)
                        }
                        
                        Divider()
                            .background(.black.opacity(0.17))
                            .frame(height: 2)
                            .padding(.top, 16)
                            .padding(.horizontal, 16)
                        
                        Text("Today is a good day to apply pesticides.")
                            .padding(.top, 12)
                            .padding(.bottom, 23)
                            .padding(.horizontal, 16)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color(hex: "857E7B"))
                    }
                    .background(
                        RoundedCorner(radius: 20, corners: .allCorners)
                            .fill(.white)
                    )
                    .padding(.top, 12)
                    
                    ScrollView(showsIndicators: false) {
                        HStack(alignment: .bottom, spacing: 0) {
                            ZStack(alignment: .bottom) {
                                Image("home_ellipse")
                                Image("home_didi")
                            }
                            .padding(.leading, 6)
                            .padding(.trailing, 0)
                            HStack(spacing: 16) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Kisani Didi")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundStyle(Color(hex: "353231"))
                                    
                                    Text("Sumita Kumari")
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundStyle(Color(hex: "353231"))
                                }
                                
                                HStack(spacing: 12) {
                                    Button {
                                        
                                    } label: {
                                        Image("home_whatsapp")
                                            .padding(10)
                                            .background(
                                                Circle()
                                                    .fill(.white)
                                            )
                                    }
                                    
                                    Button {
                                        
                                    } label: {
                                        Image("img_homePhone")
                                            .padding(10)
                                            .background(
                                                Circle()
                                                    .fill(.white)
                                            )
                                    }
                                }
                            }
                            .padding(.vertical, 27)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 16)
                        }
                        .background(
                            RoundedCorner(radius: 20, corners: .allCorners)
                                .fill(Color(hex: "B95F04").opacity(0.1))
                                .stroke(Color(hex: "B95F04").opacity(0.2), lineWidth: 1)
                        )
                        .padding(.top, 28)
                        
                        HStack {
                            Text("My Registered Lands")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(Color(hex: "353231"))
                            
                            Spacer()
                            
                            HStack(spacing: 6) {
                                Text("See all")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(Color(hex: "686868"))
                                
                                Image("right_arrow")
                            }
                        }
                        .padding(.top, 28)
                        .padding(.bottom, 30)
                        
                        VStack(spacing: 30) {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack(alignment: .top, spacing: 0) {
                                    Image("homeDummy1")
                                        .offset(y: -14)
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Paddy Field")
                                            .font(.system(size: 18, weight: .bold))
                                        
                                        HStack(alignment: .center, spacing: 8) {
                                            Image("homeGreenLeaf")
                                                .padding(8)
                                                .background(
                                                    Circle()
                                                        .fill(Color(hex: "F5F7F8"))
                                                )
                                            
                                            Text("3 Crops added")
                                                .font(.system(size: 14, weight: .semibold))
                                                .foregroundStyle(Color(hex: "7ABA3D"))
                                        }
                                        .padding(.top, 10)
                                    }
                                    .padding(.leading, 18)
                                    .padding(.top, 16)
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                
                                HStack {
                                    Text("Owned")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundStyle(Color(hex: "4E4E4E"))
                                    
                                    Spacer()
                                    
                                    Text("12 Acres")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundStyle(Color(hex: "353231"))
                                }
                                .padding(.vertical, 12)
                                .padding(.horizontal, 16)
                                .background(
                                    RoundedCorner(radius: 8, corners: .allCorners)
                                        .fill(Color(hex: "F1F1F1").opacity(0.5))
                                )
                                .padding(.horizontal, 30)
                                .padding(.bottom, 16)
                            }
                            .background(
                                RoundedCorner(radius: 20, corners: .allCorners)
                                    .fill(.white)
                                    .padding(.leading, 14)
                            )
                            
                            VStack(alignment: .leading, spacing: 0) {
                                HStack(alignment: .top, spacing: 0) {
                                    Image("homeDummy1")
                                        .offset(y: -14)
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Paddy Field")
                                            .font(.system(size: 18, weight: .bold))
                                        
                                        HStack(alignment: .center, spacing: 8) {
                                            Image("homeGreenLeaf")
                                                .padding(8)
                                                .background(
                                                    Circle()
                                                        .fill(Color(hex: "F5F7F8"))
                                                )
                                            
                                            Text("3 Crops added")
                                                .font(.system(size: 14, weight: .semibold))
                                                .foregroundStyle(Color(hex: "7ABA3D"))
                                        }
                                        .padding(.top, 10)
                                    }
                                    .padding(.leading, 18)
                                    .padding(.top, 16)
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                
                                HStack {
                                    Text("Owned")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundStyle(Color(hex: "4E4E4E"))
                                    
                                    Spacer()
                                    
                                    Text("12 Acres")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundStyle(Color(hex: "353231"))
                                }
                                .padding(.vertical, 12)
                                .padding(.horizontal, 16)
                                .background(
                                    RoundedCorner(radius: 8, corners: .allCorners)
                                        .fill(Color(hex: "F1F1F1").opacity(0.5))
                                )
                                .padding(.horizontal, 30)
                                .padding(.bottom, 16)
                            }
                            .background(
                                RoundedCorner(radius: 20, corners: .allCorners)
                                    .fill(.white)
                                    .padding(.leading, 14)
                            )
                        }
                        
                        HStack {
                            Text("Latest News")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(Color(hex: "353231"))
                            
                            Spacer()
                            
                            HStack(spacing: 6) {
                                Text("See all")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(Color(hex: "686868"))
                                
                                Image("right_arrow")
                            }
                        }
                        .padding(.top, 28)
                        .padding(.bottom, 12)
                        
                        GeometryReader { geo in
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 14) {
                                    ForEach(0..<3) { index in
                                        MainHomeNewsCardView()
                                            .frame(width: geo.size.width * 0.665)
                                            .background(
                                                index == 0 ?
                                                GeometryReader { itemGeo in
                                                    Color.clear
                                                        .preference(
                                                            key: AdaptableHeightPreferenceKey.self,
                                                            value: itemGeo.size.height
                                                        )
                                                } : nil
                                            )
                                    }
                                }
                            }
                            .onPreferenceChange(AdaptableHeightPreferenceKey.self) { value in
                                if let value {
                                    cardHeight = value
                                }
                            }
                        }
                        .frame(height: cardHeight)
                    }
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.top, 60)
                
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    VStack(spacing: 6) {
                        Image("homeTab")
                            .frame(width: 30, height: 30)
                        
                        Text("Home")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(Color(hex: "FC8019"))
                    }
                }
                
                Spacer()
                ZStack(alignment: .center) {
                    Circle()
                        .fill(Color.white)
                    Button {
                        
                    } label: {
                        Image("centerTab")
                    }
                    .padding(20)
                    .background(
                        Circle()
                            .fill(Color(hex: "FC8019"))
                            .shadow(color: .black.opacity(0.24), radius: 12, x: 0, y: 6)
                    )
                }
                .offset(y: -35)
                
                Spacer()
                Button {
                    
                } label: {
                    VStack(spacing: 6) {
                        Image("accountTab")
                            .frame(width: 30, height: 30)
                        
                        Text("Account")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(Color(hex: "625D5B"))
                    }
                }
                
                Spacer()
            }
            .frame(height: 75)
            .frame(maxWidth: .infinity)
            .background(
                RoundedCorner(radius: 6, corners: .allCorners)
                    .fill(Color.white)
            )
        }
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        MainHomeView()
    }
}


struct CenterArc: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        path.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: false
        )
        
        return path
    }
}

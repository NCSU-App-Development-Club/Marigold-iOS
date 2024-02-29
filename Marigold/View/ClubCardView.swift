//
//  ClubCardView.swift
//  Marigold
//
//  Created by Amodh on 2/22/24.
//

import SwiftUI

struct ClubCardView: View {
    private var club: Club
    
    init(club: Club) {
        self.club = club
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // Club Banner
            Image(.adcImageLg)
                .resizable()
                .scaledToFill()
                .frame(width: 357, height: 168)
                .clipped()
            
            HStack(alignment: .top) {
                // Club Logo
                Image(.adcImageSm)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 26, height: 26)
                    .clipShape(Circle())
                    .padding([.leading], 6.0)
                    .padding([.top], 8.0)
                    .clipped()
                
                VStack {
                    HStack {
                        // Club Name
                        Text(club.fullName)
                            .font(.system(size: 20.0))
                            .fontWeight(.bold)
                            .padding([.top], 8.0)
                        
                        Spacer()
                    }
                    
                    HStack {
                        // Club Role
                        Text("Vice President")
                            .font(.system(size: 12.0))
                        
                        // Create Event Button
                        Button(action: {}, label: {
                            Text("Create Event")
                                .fontWeight(.bold)
                                .font(.system(size: 12.0))
                                .foregroundColor(.purple)
                                .frame(width: 104, height: 26)
                        })
                        .background(.opacity(0.1))
                        .clipShape(.capsule)
                        
                        // Create Post Button
                        Button(action: {}, label: {
                            Text("Create Post")
                                .fontWeight(.bold)
                                .font(.system(size: 12.0))
                                .foregroundColor(.purple)
                            .frame(width: 104, height: 26)})
                        .background(.opacity(0.1))
                        .clipShape(.capsule)
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
        }.cornerRadius(10.0)
            .frame(width: 359, height: 264)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.5), radius: 3)
                    .mask(RoundedRectangle(cornerRadius: 50.0).padding(.bottom, -20))
            )
        
    }
}

#Preview {
    ClubCardView(club: Club.adc)
}

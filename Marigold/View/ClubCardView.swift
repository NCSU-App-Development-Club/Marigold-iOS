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
        VStack(alignment: .leading){
            Image(.adcImageLg).resizable().scaledToFill().frame(width: 357, height: 168).clipped()
            
            HStack(alignment: .top) {
                Image(.adcImageSm)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 26, height: 26)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding([.leading], 6.0)
                    .padding([.top], 8.0)
                    .clipped()
                
                VStack {
                    HStack {
                        Text(club.fullName).font(.system(size: 20.0)).fontWeight(.bold).padding([.top], 8.0)
                        Spacer()
                    }
                    HStack {
                        Text("Vice President").font(.system(size: 12.0))
                        Button(action: {}, label: {Text("Create Event").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 12.0)).foregroundColor(.purple)
                            .frame(width: 104, height: 26)}).background(.opacity(0.1)).clipShape(.capsule)
                        Button(action: {}, label: {Text("Create Post").fontWeight(.bold).font(.system(size: 12.0)).foregroundColor(.purple)
                            .frame(width: 104, height: 26)}).background(.opacity(0.1)).clipShape(.capsule)
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .cornerRadius(10.0).frame(width: 359, height: 264)
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
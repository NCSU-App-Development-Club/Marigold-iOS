//
//  EventCardView.swift
//  Marigold
//
//  Created by Devashish Vachhani on 2/20/24.
//

import SwiftUI

struct EventCardView: View {
    let event: Event
    let backgroundColor: Color
    private var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd - hh:mm a"
        return dateFormatter.string(from: event.date)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text(event.title)
                .font(.headline)
                .foregroundColor(.white)

            Spacer()
            
            if let club = event.club {
                HStack(spacing: 20) {
                    Text(club.shortName)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    AsyncImage(url: URL(string: club.imageUrl)) { phase in
                        switch phase {
                            case .empty:
                            EmptyView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .clipShape(Circle())
                            case .failure:
                                EmptyView()
                            @unknown default:
                                EmptyView()
                        }
                    }

                    Spacer()
                }
            }
            
            Text(date)
                .font(.caption)
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: 250, height: 125)
        .background(backgroundColor)
        .cornerRadius(12)
    }
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventCardView(event: Event.adcMeeting, backgroundColor: .blue)
    }
}


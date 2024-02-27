//
//  HomeView.swift
//  Marigold
//
//  Created by Devashish Vachhani on 2/20/24.
//

import SwiftUI

struct HomeView: View {
    // Example data for the static card placeholders
    let upcomingEvents = [
        Event(
            title: "Coding Challenge",
            body: "",
            postedBy: .kevinBarnes,
            club: .adc,
            date: Date(),
            postedAt: Date(),
            attending: [
                .kevinBarnes
            ],
            location: "Engineering Building 2 Room 5",
            isPrivate: false
        ),
        Event(
            title: "Pickup Soccer",
            body: "",
            postedBy: nil,
            club: Club(
                fullName: "Club Barcelona Team", shortName: "Club Barcelona Team", school: .ncsu, color: 1, members: [], posts: [], events: [], imageUrl: "https://play-lh.googleusercontent.com/BZwnHy1BTUzctI4htEb2-bS0z2t0aUWtkKaQJle738UDyP0IQ2NB_KvT1ME15JnxTPE"),
            date: DateComponents(calendar: .current, year: 2024, month: 2, day: 22, hour: 20, minute: 00).date!,
            postedAt: Date(),
            attending: [],
            location: "",
            isPrivate: false
        ),
        Event(
            title: "Book Fair",
            body: "",
            postedBy: nil,
            club: Club(
                fullName: "Literature Club", shortName: "Literature Club", school: .ncsu, color: 2, members: [], posts: [], events: [], imageUrl: ""),
            date: DateComponents(calendar: .current, year: 2024, month: 2, day: 24, hour: 19, minute: 30).date!,
            postedAt: Date(),
            attending: [],
            location: "",
            isPrivate: false
        )
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Upcoming Events")
                .font(.title)
                .fontWeight(.bold)
                
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(upcomingEvents, id: \.self) { event in
                        let randomColor = Color(red: .random(in: 0...1),
                                                green: .random(in: 0...1),
                                                blue: .random(in: 0...1) )
                        EventCardView(event: event, backgroundColor: randomColor)
                    }
                }
                .padding(.trailing)
            }
            .frame(height: 125)
        }
        .padding(.leading)
    }
}

#Preview {
    HomeView()
}

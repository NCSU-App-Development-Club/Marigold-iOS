//
//  ContentView.swift
//  ClubScreenDesign
//
//  Created by Evelyn Morado on 10/17/23.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    let clubs: [Club] = [.adc]

    var body: some View {
        ScrollView {
            HStack {
                Text("**NC STATE**")
                    .foregroundStyle(.red)
                    .font(.system(size: 20))
                    .padding(.leading)
                
                Spacer()
                
                Image("me")
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width:60, height: 60)
            }
            HStack {
                Text("**Your Clubs**")
                    .font(.system(size: 25))
                    .padding(.trailing, 240)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(clubs, id: \.id) {
                        item in
                        ClubCard(club: item)
                    }
                }
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            HStack {
                Text("Memberships")
                    .padding(.trailing, 240)
                    .font(.system(size: 18, weight: .bold))
            }
            Spacer()
            Spacer()
            VStack {
                HStack (alignment: .center) {
                    
                    Image("uab")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding(5)
                    
                    Text("__University Activities Board__\nThe University Activity Board puts on programs with endless and ever-changing topics.")
                        .font(.system(size: 12))
                        .frame(width: 200)
                        .padding(5)
                    
                    

                    Button {
                        
                        } label: {
                            Text("LEAVE")
                                .frame(width: 50, height: 3)
                                .font(.system(size: 15, weight: .bold))
                                .padding()
                                .foregroundStyle(.red)
                                .background(.gray.opacity(0.4))
                                .clipShape(Capsule())
                            
                        }
                    
                }
                
                HStack (alignment: .center) {
                    
                    Image("bsb")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding(5)
                    
                    Text("__Black Students Board__\nThe pursuit of culture is not really attained. It must be cultivated with strength, creativity, and unity.")
                        .font(.system(size: 12))
                        .frame(width: 200)
                        .padding(5)
                    
                    

                    Button {
                        
                        } label: {
                            Text("LEAVE")
                                .frame(width: 50, height: 3)
                                .font(.system(size: 15, weight: .bold))
                                .padding()
                                .foregroundStyle(.red)
                                .background(.gray.opacity(0.4))
                                .clipShape(Capsule())
                            
                        }
                    
                }

                HStack (alignment: .center) {
                    
                    Image("stugo")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding(5)
                    
                    Text("__Student Government__\nOrganization dedicated to attempting to better the the student experience at NC State by functioning as an advocacy group.")
                        .font(.system(size: 12))
                        .frame(width: 200)
                        .padding(5)
                    
                    

                    Button {
                        
                        } label: {
                            Text("LEAVE")
                                .frame(width: 50, height: 3)
                                .font(.system(size: 15, weight: .bold))
                                .padding()
                                .foregroundStyle(.red)
                                .background(.gray.opacity(0.4))
                                .clipShape(Capsule())
                            
                        }
                    
                }
                
                HStack (alignment: .center) {
                    
                    Image("swim")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding(5)
                    
                    Text("__Swim Club__\nRecreational sports club dedicated to students interested in swim at NC State.")
                        .font(.system(size: 12))
                        .frame(width: 200)
                        .padding(5)
                    

                    
                    

                    Button {
                        
                        } label: {
                            Text("LEAVE")
                                .frame(width: 50, height: 3)
                                .font(.system(size: 15, weight: .bold))
                                .padding()
                                .foregroundStyle(.red)
                                .background(.gray.opacity(0.4))
                                .clipShape(Capsule())
                            
                        }
                    
                }
                
                HStack (alignment: .center) {
                    
                    Image("cycling 1")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding(5)
                    
                    Text("__Cycling Club__\nRecreational sports club dedicated to students interested in cycling at NC State.")
                        .font(.system(size: 12))
                        .frame(width: 200)
                        .padding(5)
                    

                    
                    

                    Button {
                        
                        } label: {
                            Text("LEAVE")
                                .frame(width: 50, height: 3)
                                .font(.system(size: 15, weight: .bold))
                                .padding()
                                .foregroundStyle(.red)
                                .background(.gray.opacity(0.4))
                                .clipShape(Capsule())
                            
                        }
                    
                }
                
                HStack (alignment: .center) {
                    
                    Image("pb")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding(5)
                    
                    Text("__Pack Bionics__\nStudent organization at NC State focused on the design and control of prosthetic limbs.")
                        .font(.system(size: 12))
                        .frame(width: 200)
                        .padding(5)
                    

                    
                    

                    Button {
                        
                        } label: {
                            Text("LEAVE")
                                .frame(width: 50, height: 3)
                                .font(.system(size: 15, weight: .bold))
                                .padding()
                                .foregroundStyle(.red)
                                .background(.gray.opacity(0.4))
                                .clipShape(Capsule())
                            
                        }
                    
                }
            }
        }
        
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

struct ClubCard: View {
    
    var club : Club
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, content: {
                
                AsyncImage(
                    url: URL(string: club.imageUrl)!,
                    content: { image in
                        image
                            .resizable()
                            .frame(width: 250, height: 120)
                            .cornerRadius(15)
                            .shadow(radius: 15)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            
                HStack {
                    Text("\(club.fullName)")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.white)
                }
            
                HStack {
                    Button {
                            
                        } label: {
                            Text("Create Event")
                                .frame(width: 94, height: 5)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.white)
                                .padding()
                                .background(.white.opacity(0.4))
                                .clipShape(Capsule())
                                .frame(width: 130)
                            
                        }
                    
                    Button {
                            
                        } label: {
                            Text("Create Post")
                                .frame(width: 88, height: 5)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.white)
                                .padding()
                                .background(.white.opacity(0.4))
                                .clipShape(Capsule())
                                .frame(width: 125)
                            
                        }
                }
                
            })
        }
        .padding()
        .frame(width: 350, height: 200)
        .background(Color.red.opacity(0.87 ))
        .clipShape(.rect(cornerRadius: 35))
        .padding(.leading, 20)

    }
    
}

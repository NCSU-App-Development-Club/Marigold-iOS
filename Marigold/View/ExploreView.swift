//
//  ExploreView.swift
//  Marigold
//
//  Created by Evelyn Morado on 12/14/23.
//

import SwiftUI
import SwiftData

struct ExploreView: View {
    @State private var searchClub = ""
    
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
                NavigationView {
                    List {
                        ForEach(clublist) { club in
                            Text(club.name)
                        }
                    }
                    .background(.white)
                    .scrollContentBackground(.hidden)
                    .hidden()
                }
                .padding(.top, -25)
                .navigationTitle("Search")
                .searchable(text: $searchClub, prompt: "Search for clubs, events, etc.")
                .padding(.bottom, -275)
            }
            Text("Learn how to sew with the Sewing Club!")
                .font(.system(size: 20, weight: .bold))
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {
                    VStack(alignment: .center, content: {
                        AsyncImage(url: URL(string: "https://d4804za1f1gw.cloudfront.net/wp-content/uploads/sites/50/2022/05/Studio-DIY-IMG_5361-Feb-2021-scaled.jpg")!, content: { image in
                            image
                                .resizable()
                                .frame(width: 250, height: 120)
                                .cornerRadius(15)
                                .shadow(radius: 15)
                        }, placeholder: {
                            ProgressView()
                        })
                        
                        HStack {
                            Text("Sewing Club")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.white)
                            Text("Join our sewing club and discover the joy of creating and connecting through the art of fabric")
                                .font(.system(size: 8, weight: .bold))
                                .foregroundStyle(.white)
                            Button {
                                
                            }label: {
                                Text("JOIN")
                                    .frame(width: 94, height: 5)
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(.white.opacity(0.4))
                                    .clipShape(Capsule())
                                    .frame(width: 130)
                                
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
            
            Text("NC State Sponsered Clubs")
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 10)
            ScrollView(.horizontal, showsIndicators: false) {
            LazyVGrid(columns: [
                GridItem(.fixed(380)),
                GridItem(.fixed(380))
            ], content: {
                HStack {
                    
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
                
                HStack {
                    
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

            })
            }
            Text("Looking to get active? ")
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 10)
            ScrollView(.horizontal, showsIndicators: false) {
            LazyVGrid(columns: [
                GridItem(.fixed(380)),
                GridItem(.fixed(380))
            ], content: {
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
                    
                    Image("vb")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding(5)
                    
                    Text("__Volleyball Club__\nRecreational sports club dedicated to students interested in volleyball at NC State.")
                        .font(.system(size: 12))
                        .frame(width: 200)
                        .padding(5)
                    

                    
                    

                    Button {
                        
                        } label: {
                            Text("JOIN")
                                .frame(width: 50, height: 3)
                                .font(.system(size: 15, weight: .bold))
                                .padding()
                                .foregroundStyle(.red)
                                .background(.gray.opacity(0.4))
                                .clipShape(Capsule())
                            
                        }
                    
                }
                
                HStack (alignment: .center) {
                    
                    Image("soccer")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding(5)
                    
                    Text("__Soccer Club__\nRecreational sports club dedicated to students interested in soccer at NC State.")
                        .font(.system(size: 12))
                        .frame(width: 200)
                        .padding(5)
                    
                    

                    Button {
                        
                        } label: {
                            Text("JOIN")
                                .frame(width: 50, height: 3)
                                .font(.system(size: 15, weight: .bold))
                                .padding()
                                .foregroundStyle(.red)
                                .background(.gray.opacity(0.4))
                                .clipShape(Capsule())
                            
                        }
                    
                }

            })
            }

        }
    }
}

#Preview {
    ExploreView()
}

struct ClubNCSU: Identifiable {
    var id: UUID = UUID()
    var name: String
}

var clublist:[ClubNCSU] = [
    ClubNCSU(name: "App Development Club"),
    ClubNCSU(name: "SHPE"),
    ClubNCSU(name: "WiCS"),
    ClubNCSU(name: "Mi Familia"),
    ClubNCSU(name: "Student Council")
]


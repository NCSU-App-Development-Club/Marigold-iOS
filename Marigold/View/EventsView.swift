//
//  EventsView.swift
//  Marigold
//
//  Created by Kevin Barnes on 7/23/23.
//

import RealmSwift
import SwiftUI

struct EventsView: View {
    
    @ObservedRealmObject var events: RealmSwift.List<Event>
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(events) { event in
                        CardView {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text(event.title)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                }
                                
                                Text(event.body)
                                    .lineLimit(2)
                            }
                            .padding()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Upcoming Events")
        }
    }
}

#Preview {
    EventsView(events: Event.events)
}

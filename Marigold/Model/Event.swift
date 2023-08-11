//
//  Event.swift
//  Marigold
//
//  Created by Kevin Barnes on 7/23/23.
//

import Foundation
import RealmSwift

class Event: Object, Identifiable {
    
    convenience init(
        title: String,
        body: String,
        postedBy: User?,
        club: Club?,
        date: Date,
        postedAt: Date,
        attending: [User],
        location: String
    ) {
        self.init()
        self.title = title
        self.body = body
        self.postedBy = postedBy
        self.club = club
        self.date = date
        self.postedAt = postedAt
        self.attending.append(objectsIn: attending)
        self.location = location
    }
    
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var title: String
    
    @Persisted var body: String
    
    @Persisted var postedBy: User?
    
    @Persisted var club: Club?
    
    @Persisted var date: Date
    
    @Persisted var postedAt: Date
    
    @Persisted var attending: List<User> = List()
    
    @Persisted var location: String
}

#if DEBUG
extension Event {
    static var adcMeeting: Event {
        return Event(
            title: "Coding Challenge",
            body: "Our next meeting is a coding challenge! Members will be put into teams and will be tasked with completing different challenges as a team. There will be prizes for the teams that finish first.",
            postedBy: .kevinBarnes,
            club: .adc,
            date: Date(),
            postedAt: Date(),
            attending: [
                .kevinBarnes
            ],
            location: "Engineering Building 2 Room 5"
        )
    }
    
    static var events: List<Event> {
        let list = List<Event>()
        list.append(Event.adcMeeting)
        return list
    }
}
#endif

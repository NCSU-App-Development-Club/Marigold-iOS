//
//  User.swift
//  Marigold
//
//  Created by Kevin Barnes on 7/23/23.
//

import Foundation
import RealmSwift

class User: Object, Identifiable {
    
    convenience init(
        firstName: String,
        lastName: String,
        email: String,
        school: School,
        clubs: [Club],
        graduationYear: Int,
        notifications: [Notification],
        profileImageUrl: String
    ) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.clubs.append(objectsIn: clubs)
        self.graduationYear = graduationYear
        self.notifications.append(objectsIn: notifications)
        self.profileImageUrl = profileImageUrl
    }
    
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var firstName: String
    
    @Persisted var lastName: String
    
    @Persisted var email: String
    
    @Persisted var school: School?
    
    @Persisted var clubs: List<Club> = List()
    
    @Persisted var graduationYear: Int
    
    @Persisted var notifications: List<Notification> = List()
    
    @Persisted var profileImageUrl: String
}

class Notification: EmbeddedObject {
    
    convenience init(
        title: String,
        body: String,
        from: User?,
        club: Club?,
        sentAt: Date,
        isSystemNotification: Bool
    ) {
        self.init()
        self.title = title
        self.body = body
        self.from = from
        self.club = club
        self.sentAt = sentAt
        self.isSystemNotification = isSystemNotification
    }
    
    @Persisted var title: String
    
    @Persisted var body: String
    
    @Persisted var from: User?
    
    @Persisted var club: Club?
    
    @Persisted var sentAt: Date
    
    @Persisted var isSystemNotification: Bool
}

#if DEBUG
extension User {
    static var kevinBarnes: User {
        return User(
            firstName: "Kevin",
            lastName: "Barnes",
            email: "ksbarne3@ncsu.edu",
            school: .ncsu,
            clubs: [
                
            ],
            graduationYear: 2024,
            notifications: [
                
            ],
            profileImageUrl: ""
        )
    }
}

extension Notification {
    static var newMeetingTimeFromKevin: Notification {
        return Notification(
            title: "New Meeting Time!",
            body: "Today's meeting will now be held in EB II room 5 instead of 4.",
            from: nil,
            club: nil,
            sentAt: Date(),
            isSystemNotification: false
        )
    }
}
#endif

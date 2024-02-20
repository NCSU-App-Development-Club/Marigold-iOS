//
//  Club.swift
//  Marigold
//
//  Created by Kevin Barnes on 7/23/23.
//

import Foundation
import RealmSwift

class Club: Object, Identifiable {
    
    convenience init(
        fullName: String,
        shortName: String,
        school: School,
        color: Int,
        members: [User],
        posts: [Post],
        events: [Event],
        imageUrl: String
    ) {
        self.init()
        self.fullName = fullName
        self.shortName = shortName
        self.school = school
        self.color = color
        self.members.append(objectsIn: members)
        self.posts.append(objectsIn: posts)
        self.events.append(objectsIn: events)
        self.imageUrl = imageUrl
    }
    
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var fullName: String
    
    @Persisted var shortName: String
    
    @Persisted var school: School?
    
    @Persisted var color: Int
    
    @Persisted var members: List<User> = List()
    
    @Persisted var posts: List<Post> = List()
    
    @Persisted var events: List<Event> = List()
    
    @Persisted var imageUrl: String
}

class Post: EmbeddedObject {
    
    convenience init(
        title: String,
        body: String,
        postedAt: Date,
        postedBy: User?
    ) {
        self.init()
        self.title = title
        self.body = body
        self.postedAt = postedAt
        self.postedBy = postedBy
    }
    
    @Persisted var title: String
    
    @Persisted var body: String
    
    @Persisted var postedAt: Date
    
    @Persisted var postedBy: User?
}

#if DEBUG
extension Club {
    static var adc: Club {
        return Club(
            fullName: "App Development Club",
            shortName: "App Dev Club",
            school: .ncsu,
            color: 0,
            members: [
                
            ],
            posts: [
                .adcShoutOut
            ],
            events: [
                
            ],
            imageUrl: "https://se-images.campuslabs.com/clink/images/cb91ed74-19da-4075-9df2-a33fa5e3ef595cec3f9a-b48a-45c7-b092-d6ec3882cf62.jpg?preset=med-sq"
        )
    }
}

extension Post {
    static var adcShoutOut: Post {
        return Post(
            title: "Member Shout Out",
            body: "Wanted to give a quick shout out to Member Name for the amazing work they've done on the app lately! Download the newest version from the App Store to see the new feature they implemented!",
            postedAt: Date(),
            postedBy: .kevinBarnes
        )
    }
}
#endif

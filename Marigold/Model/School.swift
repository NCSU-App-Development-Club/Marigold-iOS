//
//  School.swift
//  Marigold
//
//  Created by Kevin Barnes on 7/23/23.
//

import RealmSwift

class School: Object, Identifiable {
    
    convenience init(
        fullName: String,
        abbreviation: String,
        state: String,
        type: SchoolType,
        color: Int,
        clubs: [Club]
    ) {
        self.init()
        self.fullName = fullName
        self.abbreviation = abbreviation
        self.state = state
        self.type = type
        self.color = color
        self.clubs.append(objectsIn: clubs)
    }
    
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var fullName: String
    
    @Persisted var abbreviation: String
    
    @Persisted var state: String
    
    @Persisted var type: SchoolType
    
    @Persisted var color: Int
    
    @Persisted var clubs: List<Club> = List()
    
    enum SchoolType: String, PersistableEnum {
        case university
    }
}

#if DEBUG
extension School {
    static var ncsu: School {
        return School(
            fullName: "North Carolina State University",
            abbreviation: "NC State",
            state: "North Carolina",
            type: .university,
            color: 0,
            clubs: [
                
            ]
        )
    }
}
#endif

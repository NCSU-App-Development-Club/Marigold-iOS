//
//  ContentView.swift
//  Marigold
//
//  Created by Kevin Barnes on 7/23/23.
//

import Realm
import RealmSwift
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var app: RealmSwift.App
    
    var body: some View {
        if let user = app.currentUser {
            OpenRealmView()
                .environment(\.realmConfiguration, config(user: user))
        } else {
            WelcomeView()
        }
    }
    
    func config(user: RLMUser) -> Realm.Configuration {
        var config = user.flexibleSyncConfiguration(initialSubscriptions: { subscriptions in
            if subscriptions.first(named: "users") == nil {
                subscriptions.append(
                    QuerySubscription<User>(name: "users")
                )
            }
            
            if subscriptions.first(named: "schools") == nil {
                subscriptions.append(
                    QuerySubscription<School>(name: "schools")
                )
            }
            
            if subscriptions.first(named: "clubs") == nil {
                subscriptions.append(
                    QuerySubscription<Club>(name: "clubs")
                )
            }
            
            if subscriptions.first(named: "events") == nil {
                subscriptions.append(
                    QuerySubscription<Event>(name: "events")
                )
            }
        })
        
        config.objectTypes = [
            User.self,
            School.self,
            Club.self,
            Event.self,
            Notification.self,
            Post.self
        ]
        
        return config
    }
}

#Preview {
    ContentView()
        .environmentObject(
            App(
                id: "marigold-ysffq",
                configuration: AppConfiguration(
                    baseURL: "https://realm.mongodb.com",
                    transport: nil,
                    localAppName: nil,
                    localAppVersion: nil
                )
            )
        )
}

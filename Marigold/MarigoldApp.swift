//
//  MarigoldApp.swift
//  Marigold
//
//  Created by Kevin Barnes on 7/23/23.
//

import RealmSwift
import SwiftUI

@main
struct MarigoldApp: SwiftUI.App {
    
    @StateObject var app: RealmSwift.App = App(
        id: "marigold-ysffq",
        configuration: AppConfiguration(
            baseURL: "https://realm.mongodb.com",
            transport: nil,
            localAppName: nil,
            localAppVersion: nil
        )
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(app)
        }
    }
}

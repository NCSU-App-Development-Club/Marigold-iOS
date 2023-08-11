//
//  OpenRealmView.swift
//  Marigold
//
//  Created by Kevin Barnes on 8/4/23.
//

import RealmSwift
import SwiftUI

struct OpenRealmView: View {
    
    @Environment(\.realmConfiguration) private var realmConfig
    
    @AsyncOpen(appId: "marigold-ysffq", timeout: 2000) var asyncOpen
    
    var body: some View {
        switch asyncOpen {
        case .connecting:
            ProgressView()
        case .waitingForUser:
            ProgressView()
        case .open(let realm):
            SignedInTabView()
                .environment(\.realm, realm)
                .environment(\.realmConfiguration, realmConfig)
        case .progress(_):
            ProgressView()
        case .error(let error):
            Text(error.localizedDescription)
        }
    }
}

#Preview {
    OpenRealmView()
}

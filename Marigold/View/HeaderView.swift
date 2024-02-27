//
//  HeaderView.swift
//  Marigold
//
//  Created by Michael Richardson on 2/19/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            
            Spacer()

            // Placeholder for app logo
            Image("marigold-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Spacer()

            // Placeholder for user profile
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.accentColor)
        }
        .padding([.top, .bottom], 20)
        .padding([.leading, .trailing], 30)

    }
}

#Preview {
    HeaderView()
}

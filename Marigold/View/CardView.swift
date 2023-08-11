//
//  CardView.swift
//  Marigold
//
//  Created by Kevin Barnes on 7/23/23.
//

import SwiftUI

/// Wrap content in a "card" which places the content above a rounded rectangle with a shadow.
struct CardView<Content: View>: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    let content: () -> Content
    
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(colorScheme == .dark ? .black : .white)
                .shadow(color: colorScheme == .dark ? .white.opacity(0.5) : .gray.opacity(0.5), radius: 5)
            
            content()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView {
            Text("Hey")
        }
    }
}

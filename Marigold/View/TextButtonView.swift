//
//  TextButtonView.swift
//  Marigold
//
//  Created by Devashish Vachhani on 2/20/24.
//

import SwiftUI

struct TextButtonView: View {
    var text: String
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
               label: {
                Text(text)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.yellow)
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    )
                }
        )
    }
}

#Preview {
    TextButtonView(text: "Some text")
}

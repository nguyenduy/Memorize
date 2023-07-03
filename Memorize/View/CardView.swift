//
//  Card.swift
//  Memorize
//
//  Created by Duy Nguyen on 6/28/23.
//

import SwiftUI

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        let overlay = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp {
                overlay.fill().foregroundColor(.white)
                overlay.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                overlay.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            content: "🚗",
            isFaceUp: true).foregroundColor(.red)
    }
}

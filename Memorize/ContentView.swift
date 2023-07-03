//
//  ContentView.swift
//  Memorize
//
//  Created by Duy Nguyen on 6/28/23.
//

import SwiftUI

var vehicles = ["🚗", "🚕", "🚌", "🚙", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚚", "🚜"]
var sports = ["⛷️", "🏂", "🪂", "🏋🏻‍♀️", "🤼‍♂️", "🤸‍♂️", "⛹️‍♀️", "🤾‍♂️", "🏌️‍♀️", "🤺"]
var animals = ["🪰", "🐌", "🦋", "🐞", "🐛", "🐝", "🐺", "🦇", "🦉", "🦅", "🐦‍⬛", "🦆", "🪿", "🐥"]

struct ContentView: View {
    @State var chosenThemeEmojis: [String]
    @State var emojiCount: Int

    init(chosenThemeEmojis: [String]) {
        self.chosenThemeEmojis = chosenThemeEmojis.shuffled()
        emojiCount = Int.random(in: 8 ... chosenThemeEmojis.count)
    }

    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            if chosenThemeEmojis.count > 0 {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: CGFloat(emojiCount * 10), maximum: CGFloat(emojiCount * 18)))], content: { ForEach(chosenThemeEmojis[0 ..< emojiCount], id: \.self, content: {
                        emoji in CardView(content: emoji, isFaceUp: true).aspectRatio(2 / 3, contentMode: .fit)
                    })
                    })
                }.foregroundColor(.red)
            }

            Spacer()
            HStack {
                VehicleThemeButton
                Spacer()
                AnimalThemeButton
                Spacer()
                SportThemeButton
            }.padding([.leading, .trailing], 50)

        }.padding()
    }

    var VehicleThemeButton: some View {
        Button(action: {
            chosenThemeEmojis = vehicles.shuffled()
            emojiCount = Int.random(in: 8 ... vehicles.count)
        }, label: {
            VStack {
                Image(systemName: "car").font(.title)
                Text("Vehicles").font(.caption)
            }
        })
    }

    var AnimalThemeButton: some View {
        Button(action: {
            chosenThemeEmojis = animals.shuffled()
            emojiCount = Int.random(in: 8 ... animals.count)
        }, label: {
            VStack {
                Image(systemName: "pawprint").font(.title)
                Text("Animals").font(.caption)
            }
        })
    }

    var SportThemeButton: some View {
        Button(action: {
            chosenThemeEmojis = sports.shuffled()
            emojiCount = Int.random(in: 8 ... sports.count)
        }, label: {
            VStack {
                Image(systemName: "figure.cricket").font(.title)
                Text("Sports").font(.caption)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(chosenThemeEmojis: vehicles)
    }
}

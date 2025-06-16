//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Sameer Bhati on 15/06/25.
//

import Foundation

struct Emoji:Codable{
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static let archiveURL: URL = {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            return documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
        }()
    
    static func saveTofile(emojis: [Emoji]){
        let encoder = PropertyListEncoder()
                do {
                    let data = try encoder.encode(emojis)
                    try data.write(to: archiveURL)
                } catch {
                    print("Error saving emojis: \(error)")
                }
    }
    
    static func loadFromFile() -> [Emoji]? {
        let decoder = PropertyListDecoder()
                do {
                    let data = try Data(contentsOf: archiveURL)
                    let emojis = try decoder.decode([Emoji].self, from: data)
                    return emojis
                } catch {
                    print("Error loading emojis: \(error)")
                    return nil
                }
    }
    
    static func sampleEmojis() -> [Emoji] {
           return [
               Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "Happiness"),
               Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "Uncertainty"),
               Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiling face with hearts for eyes.", usage: "Love of something"),
               Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "Law and order"),
               Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
               Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "Good memory"),
               Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "Italian food"),
               Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "Taking a risk, or a game"),
               Emoji(symbol: "📷", name: "Camera", description: "A camera.", usage: "Photography"),
               Emoji(symbol: "🏁", name: "Checkered Flag", description: "A checkered flag.", usage: "Completion")
           ]
       }
}

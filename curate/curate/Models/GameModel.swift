//
//  GameModel.swift
//  curate
//
//  Created by Yash Wani on 12/7/21.
//

import Foundation
import GameKit

struct GameModel: Codable {
    var players: [Player] = []
    var time: Int = 120
    var theme: String = "default"
    
    private var themes: [String] = ["Halloween", "Christmas", "New Years", "Beach", "Birthday", "Ball", "Freestyle"]
    
    public init() {
        self.theme = themes.randomElement()!
    }
    
}

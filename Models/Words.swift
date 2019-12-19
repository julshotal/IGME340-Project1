//
//  Words.swift
//  Hotaling_Magneto1
//
//  Created by Student on 9/27/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class Words {

    //Singleton
    static let shared = Words()
    
    //MARK: - Word Set Data
    let data = [
        "Example Haiku" : [
            "by", "cloud", "comes", "a", "cold", "crescent", "moon", "across", "the", "sky", "the", "rain", "is", "leaving"
        ],
        
        "Nature Words" : [
            "a","about","above", "after","an","ancient","and","are","as",
            "at","be","beautiful","bee","bird","bloom","blossom","blue","breath",
            "bright","but","by","cloud","cold","come","could","dark","dawn","deep","do",
            "dusk","every","fall","feel","for","forest","from",
            "frost","fruit","garden","gentle","grass", "green","has","have","they","here",
            "how","if","in","ing","is","it","know","lake", "long","love","ly","moon","moss","mountain","nature","never","night",
            "of","on","only","or","pure","quiet","r","rain","river","secret","see","s"
        ],
        
        "Space Words" : [
            "moon", "earth", "mars", "venus", "mercury", "jupiter", "uranus", "saturn", "pluto", "sun", "galaxy", "star", "orbit", "meteroid", "🌞" ,"🌝" ,"🌛" ,"🌜", "🌚", "🌕" ,"🌖", "🌗" ,"🌘" ,"🌑" ,"🌒" ,"🌓", "🌔", "🌙" ,"🌎", "🌍", "🌏" ,"💫" ,"⭐️", "🌟" ,"✨", "rocket", "suit", "space", "asteroid", "of", "or", "the", "s", "a", "the", "for", "have", "light", "dark", "cold", "bright", "planet", "void"
        ],
        
        "Emojis" : [
            "🐻", "🐼" ,"🦘" ,"🦡" ,"🐨" ,"🐯", "🦁","🐸", "🐒" ,"🐦" ,"🐣", "🦆" ,"🦢" ,"🦅", "🦉" ,"🦚", "🦜", "🦇", "🐺" ,"🐝", "🐛", "🦋" ,"🐚", "🐞", "🦗", "🕷", "🕸" ,"🐢" ,"🐍", "🦎" ,"🐙", "🦑" ,"🦐,", "🦀" ,"🐡", "🐠" ,"🐟" ,"🐬", "🐳" ,"🐋" ,"🦈", "🐊", "🐅", "🐆", "🦓", "🦍", "🐘", "🦏", "🦛", "🐪" ,"🐫", "🦙", "🦒", "🐃", "🐂" ,"🐄" ,"🐎" ,"🐖" ,"🐏","🐐" ,"🦌" ,"🐕","🐈","🐓", "🦃" ,"🕊", "🐇" ,"🐁" ,"🐀" ,"🐿" ,"🦔","🌲","🌳", "🌴", "🌱", "🌿" ,"☘️" ,"🍃", "🍂" ,"🍁", "🍄" ,"🌾","🌷", "🌹", "🌸" ,"🌼" ,"🌻", "⚡️" ,"🔥" ,"🌪", "🌈", "☀️" ,"🌤" ,"⛅️", "☁️", "🌦", "🌧", "⛈", "🌨" ,"❄️" ,"💧","☔️", "🌊"
        ]
    ]
    
    private init() {
        
    }
    
    //MARK: - Helper Functions
    func getCategoryNames() -> [String] {
        return Array(data.keys)
    }
    
    //_ means you dont need to do the arguement label (cat: "example") when calling the function
    func getWords(_ cat: String) -> [String] {
        return data[cat] ?? ["word", "set", "not", "found", "please", "try", "again"]
    }
}

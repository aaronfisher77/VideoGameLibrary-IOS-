//
//  Library.swift
//  VideoGameLibrary
//
//  Created by Aaron Fisher on 10/29/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import Foundation

import Foundation
class Library {
    //Singleton
    static let sharedInstance = Library()
    
    var games = [Game]()
    
    func populateWithTestData() {
        self.games.append(Game(
            gameTitle: "Skyrim",
            discription: "It's a fun game" ,
            rating: .e,
            genre: .adventure))
        
        self.games.append(Game(
            gameTitle: "Fallout",
            discription: "It's a fun game" ,
            rating: .e,
            genre: .adventure))
        
        self.games.append(Game(
            gameTitle: "Fortnite",
            discription: "It's a fun game" ,
            rating: .e,
            genre: .shooter))
    }
}




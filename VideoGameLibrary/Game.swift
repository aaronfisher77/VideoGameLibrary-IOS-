//
//  Game.swift
//  VideoGameLibrary
//
//  Created by Aaron Fisher on 10/29/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import Foundation

class Game {
    
    enum Genre {
        case adventure
        case shooter
        case strategy
        case other
    }
    
    enum Rating {
        case e      //Everyone
        case t      //Teens or older than 13
        case m      //Mature and any one over 17
        case ao     //Adults only
        case nr     //Not Rated this will only occur if a value is not given
    }
    
    enum Availability {
        case checkedIn
        case checkedOut(dueDate: Date)
    }
    
    let gameTitle: String
    let discription: String
    var rating: Rating
    var genre: Genre
    var availability: Availability
    
    init(gameTitle: String, discription: String, rating: Rating, genre: Genre) {
        self.gameTitle = gameTitle
        self.discription = discription
        self.availability = .checkedIn
        self.rating = rating
        self.genre = genre
    }
    
    
}

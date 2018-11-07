//
//  Game.swift
//  VideoGameLibrary
//
//  Created by Aaron Fisher on 10/29/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import Foundation

class Game{
    
    enum Genre: String {
        case adventure = "adventure"
        case shooter = "shooter"
        case strategy = "strategy"
        case other = "other"
    }
    
    enum Rating: String {
        case e = "e"    //Everyone
        case t = "t"   //Teens or older than 13
        case m = "m"   //Mature and any one over 17
        case ao = "ao"   //Adults only
        case nr = "nr"   //Not Rated this will only occur if a value is not given
    }
    
    enum Availability { // Created the variable for checking in and out a game.
        case checkedIn // checks in
        case checkedOut(dueDate: Date) // checks out
    }
    
    // creates var for the Game Class
    let gameTitle: String
    let discription: String
    var rating: Rating
    var genre: Genre
    var availability: Availability
    
    // initializes the vars in the Game class
    
    init(gameTitle: String, discription: String, rating: Rating, genre: Genre) {
        self.gameTitle = gameTitle
        self.discription = discription
        self.availability = .checkedIn
        self.rating = rating
        self.genre = genre
    }
    
    
    
}

//
//  Game.swift
//  VideoGameLibrary
//
//  Created by Aaron Fisher on 10/29/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import Foundation
import RealmSwift

class Game{
    
    enum Genre: String {
        case adventure = "adventure" // adventure
        case shooter = "shooter" // shooter
        case strategy = "strategy" // strategy
        case other = "other" // any onthert genre
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

        init(date: Date?) {
            if let date = date {
                self = .checkedOut(dueDate: date)
            } else {
                self = .checkedIn
            }
        }
    }
    
    // creates var for the Game Class
    @objc dynamic var gameTitle: String = ""
    @objc dynamic var discription: String = ""
    @objc private dynamic var ratingInternal: String = ""
    @objc private dynamic var genreInternal: String = ""
    @objc private dynamic var availInternal: Date? = nil
    
    var rating: Rating {
        get {
        return Rating(rawValue: ratingInternal)!
        }
        set {
            ratingInternal = rating.rawValue
        }
    }
    
    
    var genre: Genre {
        get {
            return Genre(rawValue: genreInternal)!
        }
        set {
            genreInternal = genre.rawValue
        }
    }
    
    var availability: Availability {
        get {
            return Availability(date: availInternal)
    }
        set {
            switch availability {
            case .checkedIn:
                availInternal = nil
            case .checkedOut(let date):
                availInternal = date
            }
        }
    }
    
    // initializes the vars in the Game class
    convenience init(gameTitle: String, discription: String, rating: Rating, genre: Genre) {
        self.init()
        self.gameTitle = gameTitle
        self.discription = discription
        self.availability = .checkedIn
        self.rating = rating
        self.genre = genre
    }
}

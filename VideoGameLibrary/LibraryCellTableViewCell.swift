//
//  LibraryCellTableViewCell.swift
//  VideoGameLibrary
//
//  Created by Aaron Fisher on 11/1/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class LibraryCell: UITableViewCell {
    
    // outlets conecting my code to the storyboard
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var availabilityCell: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var game = Game(gameTitle: "Skyrim", discription: "Its the best game ever.", rating: .e, genre: .adventure) // creates an instance of the GAme class
    
    func setup(_ game: Game) {
        titleLabel.text = game.gameTitle // Takes game title from them game library and sets it equal to the titleLabel
        genreLabel.text = game.genre.rawValue // Takes game genre from them game library and sets it equal to the genreLabel
        ratingLabel.text = game.rating.rawValue // Takes game ratingfrom them game library and sets it equal to the ratingLabel
        
        switch game.availability {
        case .checkedIn:
            //hide the due date
            dateLabel.isHidden = true
            //change the background color to ensure the user knows the game is in
            availabilityCell.backgroundColor = UIColor(red: 40/255, green: 132/255, blue: 50/255, alpha: 255/255) // sets color
        case .checkedOut(let date):
            //shows the due date
            dateLabel.isHidden = false
            //changes the color to red
            availabilityCell.backgroundColor = .red
            //sets the due date to a string
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"  // sets due date format
            dateLabel.text = dateFormatter.string(from: date)
        }
    }
}

//
//  InfoPage.swift
//  VideoGameLibrary
//
//  Created by Aaron Fisher on 11/2/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class InfoPage: UIViewController {
    
    // Outlets connnecting the storyboard to the code
    @IBOutlet weak var gameDescription: UILabel!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    
   var game: Game = Game(gameTitle: "Skyrim", discription: "Its the best game ever.", rating: .e, genre: .adventure) // creates another instance of the game
    
    @IBAction func backButton(_ sender: Any) {
         performSegue(withIdentifier: "unwindToLibrary", sender: self)
    }
    
    override func viewDidLoad() {
        gameTitle.text = game.gameTitle
        gameDescription.text = game.discription
        
        switch game.availability {
        case .checkedIn:
            //hide the due date
            dueDate.isHidden = true

        case .checkedOut(let date):
            //shows the due date
            
            dueDate.isHidden = false
            //sets the due date to a string
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy" // sets due date format
            dueDate.text = "Due Date: \(dateFormatter.string(from: date))"
        }
    }
}

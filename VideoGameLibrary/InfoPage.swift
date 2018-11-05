//
//  InfoPage.swift
//  VideoGameLibrary
//
//  Created by Aaron Fisher on 11/2/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class InfoPage: UIViewController {
    
    @IBOutlet weak var gameDescription: UILabel!
    @IBOutlet weak var gameTitle: UILabel!
   var game: Game = Game(gameTitle: "Skyrim", discription: "Its the best game ever.", rating: .e, genre: .adventure)
    
    @IBAction func backButton(_ sender: Any) {
         performSegue(withIdentifier: "unwindToLibrary", sender: self)
    }
    
    override func viewDidLoad() {
        gameTitle.text = game.gameTitle
        gameDescription.text = game.discription
    }
}

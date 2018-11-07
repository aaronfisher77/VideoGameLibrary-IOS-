//
//  AddGameViewController.swift
//  VideoGameLibrary
//
//  Created by Aaron Fisher on 10/29/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {

    // Connects buttons to the objects on the front end of the View Controller

    @IBOutlet weak var gameTitleTB: UITextField!
    @IBOutlet weak var discriptionTB: UITextField!
    @IBOutlet weak var genreSC: UISegmentedControl!
    @IBOutlet weak var ratingSC: UISegmentedControl!
    
    // Necessary Functions
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
    }
    
    @IBAction func backButton(_ sender: Any) { // Back Button
        performSegue(withIdentifier: "unwindToLibrary", sender: Any.self) // Unwinds to the LibraryVC when back button is pressed
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        guard // makes sure the variables have values
            
            let title = gameTitleTB.text, !title.isEmpty, // makes sure that the title is filled in before creating a new game
            let discription = discriptionTB.text, !discription.isEmpty // makes sure that the discription is filled in before creating a new game
            
            else{
                // Pops up an error message that makes sure you have everything filled in
                let errorAlert = UIAlertController(title: "Wait!", message: "Please ensure that all fields are filled or press back to return to the main screen", preferredStyle: UIAlertController.Style.alert)
                // Allows you to dismiss the alert when you are
                let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {UIAlertAction in})
                errorAlert.addAction(dismissAction)
                self.present(errorAlert, animated: true, completion: nil) // This makes for a cleaner transition when the error pops up
                return
                }
        
//        print(title)
//        print(discription)
        
        var gameRating: Game.Rating = .nr
        // sets the rating to the selected index
        if ratingSC?.selectedSegmentIndex == 0 {
            gameRating = .e
        }else if ratingSC?.selectedSegmentIndex == 1 {
            gameRating = .t
        }else if ratingSC?.selectedSegmentIndex == 2 {
            gameRating = .m
        }else if ratingSC?.selectedSegmentIndex == 3 {
            gameRating = .ao
        }else if ratingSC?.selectedSegmentIndex == 4 {
            gameRating = .nr
        }

        var gameGenre: Game.Genre = .other
        // sets the genre to the selected index
        if genreSC?.selectedSegmentIndex == 0 {
            gameGenre = .adventure
        }else if genreSC?.selectedSegmentIndex == 1 {
            gameGenre = .strategy
        }else if genreSC?.selectedSegmentIndex == 2 {
            gameGenre = .shooter
        }else if genreSC?.selectedSegmentIndex == 3 {
            gameGenre = .other
        }
        
        Library.sharedInstance.games.append(Game(gameTitle: title, discription: discription, rating: gameRating, genre: gameGenre)) // creates a new "Game" and enters it into the code.
        self.dismiss(animated: true, completion: nil)

        self.performSegue(withIdentifier: "unwindToLibrary", sender: self) // Unwinds to the library
    }

    
}


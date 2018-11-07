//
//  LibraryViewController.swift
//  VideoGameLibrary
//
//  Created by Aaron Fisher on 10/29/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class LibraryViewController: UIViewController, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    let library = Library.sharedInstance // Creates a globel variable the hold the library class
    
    @IBOutlet weak var TableView: UITableView! // outlet for the table view
    @IBAction func unwindToLibrary(segue: UIStoryboardSegue) { } // creates a func that allows this to be unwinded to
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TableView.emptyDataSetSource = self // TableView data source
        self.TableView.emptyDataSetDelegate = self // tab;e view delegate
        self.TableView.tableFooterView = UIView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // prepares the sugue to the info page
        if segue.destination is InfoPage { // sets the destination ot infoPage
            (segue.destination as! InfoPage).game = (sender as! LibraryCell).game // send over the variable 
        }
    }
    
    override func viewWillAppear(_ animated: Bool) { // this fucntion is called the that the data wont always be the same
        super.viewWillAppear(animated)
        TableView.reloadData() // This reloads the data so that it will update after adding a game
    }
    
    func checkOut(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row] // Identifies what game it is talking about
        let calendar = Calendar(identifier: .gregorian) // Identifies the date it is checked out
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())! // Sets the date that it neets to be returned
        game.availability = .checkedOut(dueDate: dueDate) // Sets the availibility to checked out
        (TableView.cellForRow(at: indexPath) as! LibraryCell).setup(game) // Refreshed info
    }
    
    func checkIn(at indexPath: IndexPath) { // Identifies what game it is talking about
        let game = self.library.games[indexPath.row] // Identifies the date it is checked in
        game.availability = .checkedIn// Sets the availibility to checked in
        (TableView.cellForRow(at: indexPath) as! LibraryCell).setup(game) // Refreshed info
    }
}


extension LibraryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{// Table view is asking how many rows it should have
        return library.games.count // Returns the amount of games you have in you game array as a number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! LibraryCell // Creates a cell for the LibraryCell
        
        let game = library.games[indexPath.row] // Specify index
        
        cell.game = game // Stores the game in the cell
        
        cell.setup(game) // Puts everything in their specific labels
        
        return cell // Returns cell haha
    }
    
    // Here the tableview is asking if any row should have an "edit" action.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // We create the delete action, with a closure associated with it.
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.games.remove(at: indexPath.row) // removes game form game array
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        
        let game = library.games[indexPath.row] // Specify row
        
        switch game.availability {// Creates the checkedIn and Checked out functions
        case .checkedIn:
            let checkOutAction = UITableViewRowAction(style: .normal, title: "Check Out") { _, indexPath in // Creates an option in for the cell to check in game

                self.checkOut(at: indexPath) // Checks out at selected cell
            }
            
            return [deleteAction, checkOutAction]

        case .checkedOut:
            let checkInAction = UITableViewRowAction(style: .normal, title: "Check In") { _, indexPath in// Creates an option in for the cell to check out game
                
                self.checkIn(at: indexPath)// Checks out at selected cell
            }
            
            return [deleteAction, checkInAction]
            
        }
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! { // Creates a text that displays when there are no games in the library.
        let text = "Video Game Library is Empty" // The text that will be displayed
        let attribs = [ // Sets what the text will look like
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),// Sets font
            NSAttributedString.Key.foregroundColor: UIColor.white // Sets Color
        ]
        
        return NSAttributedString(string: text, attributes: attribs) // Returns the text and attributers as a displayed text
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "There currently arent any games in your library" // The text that will be displayed
        
        let para = NSMutableParagraphStyle()
        para.lineBreakMode = NSLineBreakMode.byWordWrapping
        para.alignment = NSTextAlignment.center
        
        let attribs = [ // Sets what the text will look like
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),// Sets font
            NSAttributedString.Key.foregroundColor: UIColor.white, // Sets Color
            NSAttributedString.Key.paragraphStyle: para
        ]
        
        return NSAttributedString(string: text, attributes: attribs) // Returns the text and attributers as a displayed text
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        let text = "Add Game" // The text that will be displayed
        let attribs = [ // Sets what the text will look like
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),// Sets font
            NSAttributedString.Key.foregroundColor: view.tintColor
            
        ];func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
            let text = "Empty Library" // The text that will be displayed
            let attribs = [ // Sets what the text will look like
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), // Sets font
                NSAttributedString.Key.foregroundColor: UIColor.darkGray // Sets Color
            ]
            
            return NSAttributedString(string: text, attributes: attribs) // Returns the text and attributers as a displayed text
        }
        
        func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
            let text = "There currently arent any games in your library" // The text that will be displayed
            
            let para = NSMutableParagraphStyle()
            para.lineBreakMode = NSLineBreakMode.byWordWrapping
            para.alignment = NSTextAlignment.center
            
            let attribs = [ // Sets what the text will look like
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),// Sets font
                NSAttributedString.Key.foregroundColor: UIColor.darkGray,// Sets Color
                NSAttributedString.Key.paragraphStyle: para
            ]
            
            return NSAttributedString(string: text, attributes: attribs) // Returns the text and attributers as a displayed text
        }
        
        func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
            let text = "Add Game" // The text that will be displayed
            let attribs = [ // Sets what the text will look like
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), // Sets font
                NSAttributedString.Key.foregroundColor: view.tintColor // Sets tint Color
            ]
            
            return NSAttributedString(string: text, attributes: attribs as [NSAttributedString.Key : Any])
        }
        
        func emptyDataSetDidTapButton(_ scrollView: UIScrollView!) {
            performSegue(withIdentifier: "unwindToLibrary", sender: Any.self) // Preforms a segue to the add game function
        }
        
        return NSAttributedString(string: text, attributes: attribs as [NSAttributedString.Key : Any])
    }
    
    func emptyDataSetDidTapButton(_ scrollView: UIScrollView!) {
        performSegue(withIdentifier: "SegueToAddGame", sender: Any.self) // Preforms a segue to the add game function
    }
}

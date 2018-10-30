//
//  LibraryViewController.swift
//  VideoGameLibrary
//
//  Created by Aaron Fisher on 10/29/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    let library = Library.sharedInstance
    
    @IBOutlet weak var TableView: UITableView!
    
     @IBAction func unwindToLibrary(segue: UIStoryboardSegue) { }
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = false;
        
        library.game.append(Game(
            gameTitle: "Skyrim",
            discription: "It's a fun game" ,
            rating: .e,
            genre: .adventure))
        
        library.game.append(Game(
            gameTitle: "Fallout",
            discription: "It's a fun game" ,
            rating: .e,
            genre: .adventure))
        
        library.game.append(Game(
            gameTitle: "Fortnite",
            discription: "It's a fun game" ,
            rating: .e,
            genre: .shooter))
        
        TableView.reloadData()
    }
    
    
}


extension LibraryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return library.game.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = library.game[indexPath.row].gameTitle
        
        return cell
    }
}




//let friends = [
//    "Ezra Kiteck",
//    "Ethan Crimmins",
//    "Hannah Crimmins",
//    "Briley Barron",
//    "Owen Kiteck",
//    "Braydon Peavler",
//    "Leah Chambers",
//    "Preston Diehl",
//    "Breanna Childress",
//    "Rebecca Maxwell",
//    "Jenna Brooks",
//    "Jared Tunks",
//    "Travis Pendygraft",
//    "Taylor Davidson",
//    "Cole Wilson",
//    "Laynie Boggs",
//    "Catie Nunn",
//    "Carlee Nunn",
//    "Hannah Huffaker",
//    "Dru Smith",
//    "Tanner York",
//    "Lynsey Maxwell",
//    "Chasey Jessie",
//    "Nate Wasson",
//    "",
//    "",
//    "",
//]

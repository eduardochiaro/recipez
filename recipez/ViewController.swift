//
//  ViewController.swift
//  recipez
//
//  Created by Eduardo Chiaro on 1/19/17.
//  Copyright © 2017 Eduardo Chiaro. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var recipes = [Recipe]()
    //var fetchedResultController: NSFetchedResultsController!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchAndSet()
        tableView.reloadData()
    }
    
    func fetchAndSet() {
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Recipe")
        
        do {
            let results = try context.fetch(fetchRequest)
            self.recipes = results as! [Recipe]
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeCell {
            let recipe = recipes[indexPath.row]
            cell.configureCell(recipe: recipe)
            return cell
        }else {
            return RecipeCell()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
}


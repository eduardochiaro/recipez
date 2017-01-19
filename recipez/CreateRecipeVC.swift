//
//  CreateRecipeVC.swift
//  recipez
//
//  Created by Eduardo Chiaro on 1/19/17.
//  Copyright © 2017 Eduardo Chiaro. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var addRecipeBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        recipeImage.layer.cornerRadius = recipeImage.frame.size.width / 2
        recipeImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            recipeImage.image = pickedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func addImagePressed(_ sender: UIButton) {
        
        present(imagePicker, animated: true, completion: nil)
        
        sender.setTitle("", for: .normal)

    }
    
    @IBAction func saveRecipePressed(_ sender: Any) {
        if let title = recipeTitle.text, title != "" {
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)!
            let recipe = Recipe(entity: entity, insertInto: context)
            
            recipe.title = recipeTitle.text
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(img: recipeImage.image!)
            
            context.insert(recipe)
            do {
                try context.save()
            } catch {
                print("could not save")
            }
            
            self.navigationController?.popViewController(animated: true)
        }
    }
}

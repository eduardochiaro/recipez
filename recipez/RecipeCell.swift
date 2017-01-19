//
//  RecipeCell.swift
//  recipez
//
//  Created by Eduardo Chiaro on 1/19/17.
//  Copyright © 2017 Eduardo Chiaro. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(recipe: Recipe) {
        recipeTitle.text = recipe.title
        recipeImg.image = recipe.getRecipeImg()
        
        recipeImg.clipsToBounds = true
        recipeImg.contentMode = .scaleAspectFill
    }

}

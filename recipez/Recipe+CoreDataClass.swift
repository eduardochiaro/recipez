//
//  Recipe+CoreDataClass.swift
//  recipez
//
//  Created by Eduardo Chiaro on 1/19/17.
//  Copyright © 2017 Eduardo Chiaro. All rights reserved.
//

import Foundation
import CoreData
import UIKit


public class Recipe: NSManagedObject {
    
    
    func setRecipeImage(img: UIImage){
        let data = UIImagePNGRepresentation(img)
        self.image = data as NSData?
    }
    
    func getRecipeImg() -> UIImage {
        let img = UIImage(data: self.image! as Data)!
        return img
    }
}

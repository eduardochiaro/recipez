//
//  Recipe+CoreDataProperties.swift
//  recipez
//
//  Created by Eduardo Chiaro on 1/19/17.
//  Copyright © 2017 Eduardo Chiaro. All rights reserved.
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe");
    }

    @NSManaged public var image: NSData?
    @NSManaged public var title: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var steps: String?

}

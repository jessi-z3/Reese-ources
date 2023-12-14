//
//  Prompt+CoreDataProperties.swift
//  Reese-ources
//
//  Created by Jessi on 6/12/23.
//
//

import Foundation
import CoreData


extension Prompt {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Prompt> {
        return NSFetchRequest<Prompt>(entityName: "Prompt")
    }

    @NSManaged public var content: String?
    @NSManaged public var id: Date?

}

extension Prompt : Identifiable {

}

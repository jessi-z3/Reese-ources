//
//  Prompt+CoreDataProperties.swift
//  Reese-ources
//
//  Created by Jessi Zimmerman on 4/14/25.
//
//

import Foundation
import CoreData


extension Prompt {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Prompt> {
        return NSFetchRequest<Prompt>(entityName: "Prompt")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?

}

extension Prompt : Identifiable {

}

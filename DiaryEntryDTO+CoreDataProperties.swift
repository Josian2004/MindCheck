//
//  DiaryEntryDTO+CoreDataProperties.swift
//  MindCheck
//
//  Created by Josian van Efferen on 25/04/2023.
//
//

import Foundation
import CoreData


extension DiaryEntryDTO {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<DiaryEntryDTO> {
        return NSFetchRequest<DiaryEntryDTO>(entityName: "DiaryEntryDTO")
    }

    @NSManaged public var body: String
    @NSManaged public var created: Double
    @NSManaged public var title: String

}

extension DiaryEntryDTO : Identifiable {

}

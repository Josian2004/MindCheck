//
//  DiaryRepository.swift
//  MindCheck
//
//  Created by Josian van Efferen on 25/04/2023.
//

import Foundation
import CoreData

class DietRepository {
    private let coreDataContainer: NSPersistentContainer
    
    init() {
        coreDataContainer = Provider.coreDataContainerInstance
    }
    
    func newEntry(diaryEntry: DiaryEntry) {
        let _diaryEntry = DiaryEntryDTO(context: coreDataContainer.viewContext)
        _diaryEntry.title = diaryEntry.title
        _diaryEntry.body = diaryEntry.body
        _diaryEntry.created = diaryEntry.created
        
        saveContext()
    }
    
    func getAllEntries() -> [DiaryEntry] {
        var entries: [DiaryEntry] = []
        let request = DiaryEntryDTO.createFetchRequest()
        let sort = NSSortDescriptor(key: "created", ascending: false)
        request.sortDescriptors = [sort]
        
        do {
            let _entries = try coreDataContainer.viewContext.fetch(request)
            _entries.forEach({ entry in
                entries.append(DiaryEntry(body: entry.body, title: entry.title, created: entry.created))
            })
        } catch {
            print("Fetch Failed")
        }
        
        return entries
    }
    
    func saveContext() {
        if coreDataContainer.viewContext.hasChanges {
            do {
                try coreDataContainer.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
}

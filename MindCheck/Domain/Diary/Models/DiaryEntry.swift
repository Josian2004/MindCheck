//
//  DiaryEntry.swift
//  MindCheck
//
//  Created by Josian van Efferen on 25/04/2023.
//

import Foundation

class DiaryEntry {
    let body: String
    let title: String
    let created: Double
    
    init(body: String, title: String, created: Double) {
        self.body = body
        self.title = title
        self.created = created
    }
}

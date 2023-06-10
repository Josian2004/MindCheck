//
//  SleepSegmentModel.swift
//  MindCheck
//
//  Created by Josian van Efferen on 18/04/2023.
//

import Foundation
import HealthKit


class SleepSegmentModel {
    let startTime: Double
    let endTime: Double
    let duration: Double
    let source: String
    let category: HKCategoryValueSleepAnalysis
    
    init(startTime: Double, endTime: Double, duration: Double, source: String, category: HKCategoryValueSleepAnalysis) {
        self.startTime = startTime
        self.endTime = endTime
        self.duration = duration
        self.source = source
        self.category = category
    }
    
    public var description: String {
        return "Start: \(NSDate(timeIntervalSince1970: startTime)) - End: \(NSDate(timeIntervalSince1970: endTime)) - Duration: \(duration) - Source: \(source) - Category: \(category)"
    }
}

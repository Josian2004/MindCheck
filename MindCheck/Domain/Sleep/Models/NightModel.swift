//
//  NightModel.swift
//  MindCheck
//
//  Created by Josian van Efferen on 18/04/2023.
//

import Foundation

class NightModel {
    let fallAsleepTime: Double
    let wakeUpTime: Double
    let asleepDuration: Double
    let inBedTime: Double
    let inBedAmount: Double
    let sleepSegments: [SleepSegmentModel]
    let inBedSegments: [SleepSegmentModel]
    let asleepSegments: [SleepSegmentModel]
    
    init(fallAsleepTime: Double, wakeUpTime: Double, asleepDuration: Double, inBedTime: Double, inBedAmount: Double, sleepSegments: [SleepSegmentModel], inBedSegments: [SleepSegmentModel], asleepSegments: [SleepSegmentModel]) {
        self.fallAsleepTime = fallAsleepTime
        self.wakeUpTime = wakeUpTime
        self.asleepDuration = asleepDuration
        self.inBedTime = inBedTime
        self.inBedAmount = inBedAmount
        self.sleepSegments = sleepSegments
        self.inBedSegments = inBedSegments
        self.asleepSegments = asleepSegments
    }
}

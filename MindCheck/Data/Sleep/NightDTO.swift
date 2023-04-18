//
//  NightDTO.swift
//  MindCheck
//
//  Created by Josian van Efferen on 18/04/2023.
//

import Foundation

class NightDTO {
    let fallAsleepTime: Double
    let wakeUpTime: Double
    let asleepDuration: Double
    let inBedTime: Double
    let inBedAmount: Double
    let sleepSegments: [SleepSegmentDTO]
    let inBedSegments: [SleepSegmentDTO]
    let asleepSegments: [SleepSegmentDTO]
    
    init(fallAsleepTime: Double, wakeUpTime: Double, asleepDuration: Double, inBedTime: Double, inBedAmount: Double, sleepSegments: [SleepSegmentDTO], inBedSegments: [SleepSegmentDTO], asleepSegments: [SleepSegmentDTO]) {
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

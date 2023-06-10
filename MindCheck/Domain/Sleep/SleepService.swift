//
//  SleepService.swift
//  MindCheck
//
//  Created by Josian van Efferen on 18/04/2023.
//

import Foundation
import HealthKit

class SleepService {
    private let sleepRepository: SleepRepository
    
    init() {
        sleepRepository = Provider.sleepRepositoryInstance
    }
    
    func getLastWeek(completion: @escaping ([NightModel], Error?) -> Void) {
        sleepRepository.getLastWeek() {
            (nights, error) in
            if ((error) != nil) {
                completion([], error)
            }
            var nightModels: [NightModel] = []
            for night in nights {
                var sleepSegments: [SleepSegmentModel] = []
                var inBedSegments: [SleepSegmentModel] = []
                var asleepSegments: [SleepSegmentModel] = []
                night
                    .forEach({ sample in
                        guard let sleepValue = HKCategoryValueSleepAnalysis(rawValue: sample.value) else { return }
                        let sleepSegment = SleepSegmentModel(startTime: Double(sample.startDate.timeIntervalSince1970), endTime: Double(sample.endDate.timeIntervalSince1970), duration: sample.endDate.timeIntervalSince1970 - sample.startDate.timeIntervalSince1970, source: sample.sourceRevision.productType ?? "Unknown", category: sleepValue)
                        if (sleepSegment.duration > 59) {
                            if (sleepSegment.category == .inBed) {
                                if (sleepSegment.source.contains("iPhone") && sleepSegment.duration > 299) {
                                    inBedSegments.append(sleepSegment)
                                }
                                else if (sleepSegment.source.contains("Watch")) {
                                    asleepSegments.append(sleepSegment)
                                }
                                
                            } else {
                                sleepSegments.append(sleepSegment)
                            }
                        }
                    })
                
                let fallAsleepTime: Double
                let wakeUpTime: Double
                let asleepDuration: Double
                if (!asleepSegments.isEmpty) {
                    fallAsleepTime = asleepSegments.first!.startTime
                    wakeUpTime = asleepSegments.last!.endTime
                    asleepDuration = asleepSegments.last!.endTime - asleepSegments.first!.startTime
                } else {
                    fallAsleepTime = -1
                    wakeUpTime = -1
                    asleepDuration = -1
                }
                
                let inBedTime: Double
                let inBedAmount: Double
                if (!inBedSegments.isEmpty) {
                    inBedTime = inBedSegments.first!.startTime
                    inBedAmount = inBedSegments.last!.endTime - inBedSegments.first!.startTime
                } else {
                    inBedTime = -1
                    inBedAmount = -1
                }
                let nightModel: NightModel = NightModel(fallAsleepTime: fallAsleepTime, wakeUpTime: wakeUpTime, asleepDuration: asleepDuration, inBedTime: inBedTime, inBedAmount: inBedAmount, sleepSegments: sleepSegments, inBedSegments: inBedSegments, asleepSegments: asleepSegments)
                nightModels.append(nightModel)
            }
            
            completion(nightModels, nil)
        }
    }
        
    func getLastNight(completion: @escaping (NightModel?, Error?) -> Void) {
        
        sleepRepository.getLastNight() {
            (samples, error) in
            
            if ((error) != nil) {
                completion(nil, error)
            }
            var sleepSegments: [SleepSegmentModel] = []
            var inBedSegments: [SleepSegmentModel] = []
            var asleepSegments: [SleepSegmentModel] = []
            
            samples
                .forEach({ sample in
                    guard let sleepValue = HKCategoryValueSleepAnalysis(rawValue: sample.value) else { return }
                    let sleepSegment = SleepSegmentModel(startTime: Double(sample.startDate.timeIntervalSince1970), endTime: Double(sample.endDate.timeIntervalSince1970), duration: sample.endDate.timeIntervalSince1970 - sample.startDate.timeIntervalSince1970, source: sample.sourceRevision.productType ?? "Unknown", category: sleepValue)
                    if (sleepSegment.duration > 59) {
                        if (sleepSegment.category == .inBed) {
                            if (sleepSegment.source.contains("iPhone") && sleepSegment.duration > 299) {
                                inBedSegments.append(sleepSegment)
                            }
                            else if (sleepSegment.source.contains("Watch")) {
                                asleepSegments.append(sleepSegment)
                            }
                            
                        } else {
                            sleepSegments.append(sleepSegment)
                        }
                    }
                })

            let fallAsleepTime: Double
            let wakeUpTime: Double
            let asleepDuration: Double
            if (!asleepSegments.isEmpty) {
                fallAsleepTime = asleepSegments.first!.startTime
                wakeUpTime = asleepSegments.last!.endTime
                asleepDuration = asleepSegments.last!.endTime - asleepSegments.first!.startTime
            } else {
                fallAsleepTime = -1
                wakeUpTime = -1
                asleepDuration = -1
            }
            
            let inBedTime: Double
            let inBedAmount: Double
            if (!inBedSegments.isEmpty) {
                inBedTime = inBedSegments.first!.startTime
                inBedAmount = inBedSegments.last!.endTime - inBedSegments.first!.startTime
            } else {
                inBedTime = -1
                inBedAmount = -1
            }
            let nightModel: NightModel = NightModel(fallAsleepTime: fallAsleepTime, wakeUpTime: wakeUpTime, asleepDuration: asleepDuration, inBedTime: inBedTime, inBedAmount: inBedAmount, sleepSegments: sleepSegments, inBedSegments: inBedSegments, asleepSegments: asleepSegments)
            completion(nightModel, nil)
            
        }
        
    }
}

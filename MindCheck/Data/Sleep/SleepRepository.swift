//
//  File.swift
//  MindCheck
//
//  Created by Josian van Efferen on 18/04/2023.
//

import Foundation
import HealthKit

class SleepRepository {
    private let healthStore: HKHealthStore
    
    init() {
        healthStore = Provider.healthStoreInstance
    }
    
    func getLastNight(completion: @escaping ([HKCategorySample], Error?) -> Swift.Void) {
        
        guard let sampleType = HKSampleType.categoryType(forIdentifier: .sleepAnalysis) else { fatalError("*** This method should never fail ***") }
        
        let predicate = HKQuery.predicateForSamples(withStart: Date.init(timeIntervalSinceNow: -86400*2), end: Date.now, options: .strictStartDate)
        
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: nil) {
            (query, results, error) in
            
            guard var samples = results as? [HKCategorySample] else {
                completion([], error)
                return
            }
            
            var finalSamples: [HKCategorySample] = []
            samples.reverse()
            
            for sampleIndex in 0...samples.count {
                let currentSample = samples[sampleIndex]
                if (currentSample != samples.last) {
                    let nextSample = samples[sampleIndex + 1]
                    
                    if ((currentSample.startDate.timeIntervalSince1970 - nextSample.endDate.timeIntervalSince1970) > 3600) {
                        finalSamples.append(currentSample)
                        break
                    }
                }
                
                finalSamples.append(currentSample)
                
            }
            finalSamples.reverse()
            
            
            completion(finalSamples, nil)
        }
            
        healthStore.execute(query)
    }
    
    
    func getLastWeek(completion: @escaping ([[HKCategorySample]], Error?) -> Swift.Void) {
        
        guard let sampleType = HKSampleType.categoryType(forIdentifier: .sleepAnalysis) else { fatalError("*** This method should never fail ***") }
        
        let predicate = HKQuery.predicateForSamples(withStart: Date.init(timeIntervalSinceNow: -86400*8), end: Date.now, options: .strictStartDate)
        
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: nil) {
            (query, results, error) in
            
            guard var samples = results as? [HKCategorySample] else {
                completion([], error)
                return
            }
            
            var finalSamples: [[HKCategorySample]] = []
            var tempSamples: [HKCategorySample] = []
            samples.reverse()
            
            for sampleIndex in 0...samples.count {
                var next = false
                if (finalSamples.count > 6) {
                    break
                }
                let currentSample = samples[sampleIndex]
                if (currentSample != samples.last) {
                    let nextSample = samples[sampleIndex + 1]
                    
                    if ((currentSample.startDate.timeIntervalSince1970 - nextSample.endDate.timeIntervalSince1970) > 3600) {
                        tempSamples.append(currentSample)
                        tempSamples.reverse()
                        finalSamples.append(tempSamples)
                        tempSamples.removeAll()
                        next = true
                    }
                }
                if (!next) {
                    tempSamples.append(currentSample)
                }
                
                
            }
            //finalSamples.reverse()
            
            
            completion(finalSamples, nil)
        }
            
        healthStore.execute(query)
    }
}

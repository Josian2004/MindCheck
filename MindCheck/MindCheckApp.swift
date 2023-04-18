//
//  MindCheckApp.swift
//  MindCheck
//
//  Created by Josian van Efferen on 22/03/2023.
//

import SwiftUI
import HealthKit

class TimeViewObject {
    let hours: Int
    let minutes: Int
    
    init(hours: Int, minutes: Int) {
        self.hours = hours
        self.minutes = minutes
    }
}

final class Provider: NSObject {
    static let healthStoreInstance = HKHealthStore()
    static let sleepRepositoryInstance = SleepRepository()
    static let sleepServiceInstance = SleepService()
}

@main
struct MindCheckApp: App {
    private let healthStore: HKHealthStore
    init() {
        guard HKHealthStore.isHealthDataAvailable() else {  fatalError("This app requires a device that supports HealthKit") }
        healthStore = Provider.healthStoreInstance
        requestHealthkitPermissions()
    }
    
    
    private func requestHealthkitPermissions() {
            
            let sampleTypesToRead = Set([
                HKObjectType.characteristicType(forIdentifier: .biologicalSex)!,
                HKObjectType.characteristicType(forIdentifier: .dateOfBirth)!,
                HKObjectType.quantityType(forIdentifier: .heartRate)!,
                HKObjectType.categoryType(forIdentifier: .highHeartRateEvent)!,
                HKObjectType.quantityType(forIdentifier: .restingHeartRate)!,
                HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
                HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
                HKObjectType.categoryType(forIdentifier: .mindfulSession)!
            ])
            
            healthStore.requestAuthorization(toShare: nil, read: sampleTypesToRead) { (success, error) in
                print("Request Authorization -- Success: ", success, " Error: ", error ?? "nil")
            }
        }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeUIView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .preferredColorScheme(.light)
                
                DiaryUIView()
                    .tabItem {
                        Label("Diary", systemImage: "book.fill")
                    }
                    .preferredColorScheme(.light)
                
                DataUIView()
                    .tabItem {
                        Label("Data", systemImage: "chart.bar.fill")
                    }
                    .preferredColorScheme(.light)
                
                SleepUIView()
                    .tabItem {
                        Label("Sleep", systemImage: "bed.double.fill")
                    }
                    .preferredColorScheme(.light)
            }
            
        }
    }
}

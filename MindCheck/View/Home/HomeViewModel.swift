//
//  HomeViewModel.swift
//  MindCheck
//
//  Created by Josian van Efferen on 18/04/2023.
//

import Foundation
import HealthKit

class HomeViewModel: ObservableObject {
    private let healthStore: HKHealthStore
    private let sleepRepository: SleepRepository
    private let sleepService: SleepService
    
    @Published var asleepToday: TimeViewObject = TimeViewObject(hours: 0, minutes: 0)
    @Published var asleepAvrWeek: TimeViewObject = TimeViewObject(hours: 0, minutes: 0)
    @Published var outBedToday: TimeViewObject = TimeViewObject(hours: 0, minutes: 0)
    
    init() {
        self.healthStore = Provider.healthStoreInstance
        self.sleepRepository = Provider.sleepRepositoryInstance
        self.sleepService = Provider.sleepServiceInstance
    }
    
    func updateSleepWidget() {
        sleepService.getLastNight() { nightModel, error in
            let _hoursAsleep: Int = Int(floor((nightModel!.asleepDuration/60)/60))
            let _minutesAsleep: Int = Int(ceil((nightModel!.asleepDuration/60) - (floor((nightModel!.asleepDuration/60)/60)*60)))
            DispatchQueue.main.async {
                self.asleepToday = TimeViewObject(hours: _hoursAsleep, minutes: _minutesAsleep)
            }
        }
        
        sleepService.getLastWeek() { nightModels, error in
            var timeAsleep: Double = 0
            for nightModel in nightModels {
                timeAsleep += nightModel.asleepDuration
                print((nightModel.asleepDuration/60)/60)
            }
            let average = timeAsleep/Double(nightModels.count)
            
            let _hours: Int = Int(floor((average/60)/60))
            let _minutes: Int = Int(ceil((average/60) - (floor((average/60)/60)*60)))
            DispatchQueue.main.async {
                self.asleepAvrWeek = TimeViewObject(hours: _hours, minutes: _minutes)
            }
        }
    }
}

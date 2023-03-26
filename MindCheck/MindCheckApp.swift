//
//  MindCheckApp.swift
//  MindCheck
//
//  Created by Josian van Efferen on 22/03/2023.
//

import SwiftUI

@main
struct MindCheckApp: App {
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

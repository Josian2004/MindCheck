//
//  DataUIView.swift
//  MindCheck
//
//  Created by Josian van Efferen on 26/03/2023.
//

import SwiftUI

struct DataUIView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    dataCategoriesList()
                    Spacer().frame(minHeight: 20)
                }
                .navigationTitle("Data")
                .padding(.horizontal, 20)
                .padding(.top, 20.0)
                //.padding(.bottom, 20)
                .background(Color(UIColor.secondarySystemBackground))
            }
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}


private struct dataCategoriesList: View {
    var body: some View {
        List {
            NavigationLink{
                StressDetailUIView()
            } label: {
                
                Label {
                    Text("Stress")
                        .foregroundColor(Color(UIColor.label))
                        .padding(.vertical, 10)
                } icon: {
                    Image(systemName: "brain.head.profile")
                        .renderingMode(.original)
                        .font(.title2)
                }
                    .font(.title3)
                    .fontWeight(.semibold)
                
            }.alignmentGuide(.listRowSeparatorLeading) { viewDimensions in return 0 }
            
            NavigationLink{
                SleepDetailUIView()
            } label: {
                
                Label {
                    Text("Sleep")
                        .foregroundColor(Color(UIColor.label))
                        .padding(.vertical, 10)
                } icon: {
                    Image(systemName: "bed.double.fill")
                        .renderingMode(.original)
                        .font(.title2)
                }
                    .font(.title3)
                    .fontWeight(.semibold)
                
            }.alignmentGuide(.listRowSeparatorLeading) { viewDimensions in return 0 }
            
            NavigationLink{
                MoodDetailUIView()
            } label: {
                
                Label {
                    Text("Mood")
                        .foregroundColor(Color(UIColor.label))
                        .padding(.vertical, 10)
                } icon: {
                    Image(systemName: "sun.max.fill")
                        .renderingMode(.original)
                        .font(.title2)
                }
                    .font(.title3)
                    .fontWeight(.semibold)
                
            }.alignmentGuide(.listRowSeparatorLeading) { viewDimensions in return 0 }
            
            NavigationLink{
                MentalEventsDetailUIView()
            } label: {
                
                Label {
                    Text("Mental Health Events")
                        .foregroundColor(Color(UIColor.label))
                        .padding(.vertical, 10)
                } icon: {
                    Image(systemName: "staroflife.fill")
                        .renderingMode(.original)
                        .font(.title2)
                }
                    .font(.title3)
                    .fontWeight(.semibold)
                
            }.alignmentGuide(.listRowSeparatorLeading) { viewDimensions in return 0 }
            
        }
        .frame(width: UIScreen.main.bounds.size.width, height: 400.0)
        .padding(.top, -35)
        
        
    }
}

struct DataUIView_Previews: PreviewProvider {
    static var previews: some View {
        DataUIView()
    }
}

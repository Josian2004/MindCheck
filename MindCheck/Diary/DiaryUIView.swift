//
//  DiaryUIView.swift
//  MindCheck
//
//  Created by Josian van Efferen on 26/03/2023.
//

import SwiftUI

struct DiaryUIView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    stressEntry()
                    mentalEvent(title: "I went through a panic attack", bodyText: "The room I was in got really crowded and I couldn't handle all the people.", time: "16:20")
                    diaryEntry(title: "Trouble getting out of bed.", bodyText: "I had some troubles getting out of bed today, I’m not sure why this happened but I was overthinking a lot of things from the past few weeks.", time: "13:32")
                    diaryEntry(bodyText: "I had some troubles getting out of bed today, I’m not sure why this happened but I was overthinking a lot of things from the past few weeks.", time: "13:32")
                    Spacer().frame(minHeight: 20)
                }
                .navigationTitle("Diary")
                .padding(.horizontal, 20)
                .padding(.top, 20.0)
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}

private struct stressEntry: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Label("Stress Levels", systemImage: "brain.head.profile")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                .padding([.horizontal], 15)
                .padding(.top, 10)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(UIColor.systemGray4))
                    .padding([.horizontal, .top], 10)
            }
            
            Text("Your stress levels today were higher than usual.")
                .font(.headline)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 1)
                .padding(.bottom, 15)
                .padding(.horizontal, 15)
                
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .leading
          )
        .background(Color(UIColor.systemBackground), ignoresSafeAreaEdges: [])
        .cornerRadius(10)
    }
}


private struct mentalEvent: View {
    var title: String
    var bodyText: String
    var time: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                
                Spacer()
                
                Text(time)
                    .font(.caption)
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .padding(.horizontal, 15)

            }
            
            Text("What happened?")
                .font(.subheadline)
                .fontWeight(.semibold)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 15)

            Divider()
                .padding(.horizontal, 10)
            
            Text(bodyText)
                .font(.subheadline)
                .fontDesign(.serif)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .leading
          )
        .background(Color(UIColor.systemBackground), ignoresSafeAreaEdges: [])
        .cornerRadius(10)
        .padding(.top, 10)
    }
}


private struct diaryEntry: View {
    var title: String?
    var bodyText: String
    var time: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if (title != nil) {
                HStack {
                    Text(title!)
                        .font(.headline)
                        .fontDesign(.serif)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    
                    Spacer()
                    
                    Text(time)
                        .font(.caption)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .padding(.horizontal, 15)
                }
                
                Divider()
                    .padding(.horizontal, 10)
                
                Text(bodyText)
                    .font(.subheadline)
                    .fontDesign(.serif)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
            } else {
                HStack(alignment: .top) {
                    Text(bodyText)
                        .font(.subheadline)
                        .fontDesign(.serif)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    
                    Spacer()
                    
                    Text(time)
                        .font(.caption)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .padding(.horizontal, 15)
                        .padding(.top, 10)
                }
            }
            
            
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .leading
          )
        .background(Color(UIColor.systemBackground), ignoresSafeAreaEdges: [])
        .cornerRadius(10)
        .padding(.top, 10)
    }
}

struct DiaryUIView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryUIView()
    }
}

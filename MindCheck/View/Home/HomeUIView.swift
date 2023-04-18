//
//  HomeUIView.swift
//  MindCheck
//
//  Created by Josian van Efferen on 26/03/2023.
//

import SwiftUI

struct HomeUIView: View {
    private var vm: HomeViewModel = HomeViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    howAreYouFeeling()
                    mentalEvent()
                    stressLevels()
                    asleep(vm: vm)
                    outOfBed()
                    Spacer().frame(minHeight: 20)
                }
                .navigationTitle("Home")
                .padding(.horizontal, 20)
                .padding(.top, 20.0)
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .background(Color(UIColor.secondarySystemBackground))
        }.onAppear() {
            vm.updateSleepWidget()
        }
    }
}




private struct howAreYouFeeling: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Label("How do you feel right now?", systemImage: "sun.max.fill")
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding(.horizontal, 15)
                .padding(.top, 10)
            
            HStack() {
                
                Button(action: {}) {
                    Image(systemName: "face.smiling")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .foregroundColor(Color(UIColor.systemRed))
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "face.smiling")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .foregroundColor(Color(UIColor.systemOrange))
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "face.smiling")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .foregroundColor(Color(UIColor.systemYellow))
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "face.smiling")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .foregroundColor(Color(UIColor.systemGreen))
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "face.smiling")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .foregroundColor(Color(UIColor.systemGreen))
                
            }
            .padding([.leading, .trailing], 15)
            .padding(.top, 10)
            .padding(.bottom, 20)
            //.frame(width: .infinity)
            
        }
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          alignment: .leading
        )
        .background(Color(UIColor.systemBackground), ignoresSafeAreaEdges: [])
        .cornerRadius(10)
    }
}



private struct stressLevels: View {
    var body: some View {
        NavigationLink{
            StressDetailUIView()
        } label: {
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
                
                
                Text("Your stress levels today are higher than usual.")
                    .font(.headline)
                    //.fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.label))
                    .padding(.horizontal, 15)
                    .padding(.top, 1)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                Divider()
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("87")
                                .font(.title)
                                .fontWeight(.semibold)
                            Image(systemName: "chevron.up.circle.fill")
                                .offset(x: -7)
                                .font(.title3)
                        }
                        Text("Average Today")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color(UIColor.systemYellow))
                    .padding(15)
                    
                    Divider().padding(10)
                    
                    VStack(alignment: .leading) {
                        Text("57")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Average this week")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color(UIColor.systemGreen))
                    .padding(10)
                }.padding(.bottom, 5)
                
            }
            .frame(
              minWidth: 0,
              maxWidth: .infinity,
              alignment: .leading
            )
            .background(Color(UIColor.systemBackground), ignoresSafeAreaEdges: [])
            .cornerRadius(10)
        }
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          alignment: .leading)
        .padding(.top, 5)
        
    }
}


private struct asleep: View {
    @ObservedObject var vm: HomeViewModel
    var body: some View {
        NavigationLink{
            SleepDetailUIView()
        } label: {
            VStack(alignment: .leading) {
                
                HStack {
                    Label("Asleep", systemImage: "bed.double.fill")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    .padding([.horizontal], 15)
                    .padding(.top, 10)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(UIColor.systemGray4))
                        .padding([.horizontal, .top], 10)
                }
                
                
                Text("You're averaging about the same amount of sleep today compared to the rest of the week.")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.headline)
                    //.fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.label))
                    .padding(.horizontal, 15)
                    .padding(.top, 1)
                    .multilineTextAlignment(.leading)
                
                Divider()
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(String(vm.asleepToday.hours))
                                .font(.title)
                                .fontWeight(.semibold)
                            + Text("hr")
                                .font(.body)
                                .fontWeight(.medium)
                            
                            Text(String(vm.asleepToday.minutes))
                                .font(.title)
                                .fontWeight(.semibold)
                            + Text("min")
                                .font(.body)
                                .fontWeight(.medium)
                        }
                            
                        Text("Today")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color(UIColor.systemGreen))
                    .padding(15)
                    
                    Divider().padding(10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(String(vm.asleepAvrWeek.hours))
                                .font(.title)
                                .fontWeight(.semibold)
                            + Text("hr")
                                .font(.body)
                                .fontWeight(.medium)
                            
                            Text(String(vm.asleepAvrWeek.minutes))
                                .font(.title)
                                .fontWeight(.semibold)
                            + Text("min")
                                .font(.body)
                                .fontWeight(.medium)
                        }

                        Text("Average this week")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color(UIColor.systemGreen))
                    .padding(10)
                }.padding(.bottom, 5)
                
            }
            .frame(
              minWidth: 0,
              maxWidth: .infinity,
              alignment: .leading
            )
            .background(Color(UIColor.systemBackground), ignoresSafeAreaEdges: [])
            .cornerRadius(10)
        }
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          alignment: .leading)
        .padding(.top, 5)
        
    }
}


private struct outOfBed: View {
    var body: some View {
        NavigationLink{
            SleepDetailUIView()
        } label: {
            VStack(alignment: .leading) {
                
                HStack {
                    Label("Out of Bed", systemImage: "bed.double.fill")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    .padding([.horizontal], 15)
                    .padding(.top, 10)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(UIColor.systemGray4))
                        .padding([.horizontal, .top], 10)
                }
                
                
                Text("I noticed that you had some troubles getting out of bed this morning.")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.headline)
                    //.fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.label))
                    .padding(.horizontal, 15)
                    .padding(.top, 1)
                    .multilineTextAlignment(.leading)
                
                Divider()
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("2")
                                .font(.title)
                                .fontWeight(.semibold)
                            + Text("hr")
                                .font(.body)
                                .fontWeight(.medium)
                            
                            Text("13")
                                .font(.title)
                                .fontWeight(.semibold)
                            + Text("min")
                                .font(.body)
                                .fontWeight(.medium)
                        }
                            
                        Text("Average Today")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color(UIColor.systemRed))
                    .padding(15)
                    
                    Divider().padding(10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("1")
                                .font(.title)
                                .fontWeight(.semibold)
                            + Text("hr")
                                .font(.body)
                                .fontWeight(.medium)
                            
                            Text("13")
                                .font(.title)
                                .fontWeight(.semibold)
                            + Text("min")
                                .font(.body)
                                .fontWeight(.medium)
                        }

                        Text("Average this week")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color(UIColor.systemYellow))
                    .padding(10)
                }.padding(.bottom, 5)
                
            }
            .frame(
              minWidth: 0,
              maxWidth: .infinity,
              alignment: .leading
            )
            .background(Color(UIColor.systemBackground), ignoresSafeAreaEdges: [])
            .cornerRadius(10)
        }
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          alignment: .leading)
        .padding(.top, 5)
        
    }
}



private struct mentalEvent: View {
    var body: some View {
        NavigationLink{
            MentalEventsDetailUIView()
        } label: {
            VStack(alignment: .leading) {
                
                HStack {
                    Label("Mental Health Events", systemImage: "staroflife.fill")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    .padding([.horizontal], 15)
                    .padding(.top, 10)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(UIColor.systemGray4))
                        .padding([.horizontal, .top], 10)
                }
                
                
                Text("Here you can keep track of things like feelings of anxiety or depression, panic attacks, etc.")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.headline)
                    //.fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.label))
                    .padding(.horizontal, 15)
                    .padding(.top, 1)
                    .multilineTextAlignment(.leading)
                
                Divider()
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                
                
                Button(action: {}) {
                    Text("I'm going trough something right now")
                        .foregroundColor(Color(UIColor.white))
                        .fontWeight(.semibold)
                        .font(.body)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle(radius: 15))
                .controlSize(.large)
                .background(Color.accentColor)
                .cornerRadius(15)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.bottom, 20)
            }
            .frame(
              minWidth: 0,
              maxWidth: .infinity,
              alignment: .leading
            )
            .background(Color(UIColor.systemBackground), ignoresSafeAreaEdges: [])
            .cornerRadius(10)
        }
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          alignment: .leading)
        .padding(.top, 5)
        
    }
}






struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}

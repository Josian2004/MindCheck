//
//  HomeUIView.swift
//  MindCheck
//
//  Created by Josian van Efferen on 26/03/2023.
//

import SwiftUI

struct HomeUIView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    howAreYouFeeling()
                    stressLevels()
                    Spacer()
                }
                .navigationTitle("Home")
                .padding(.horizontal, 20)
                .padding(.top, 20.0)
                .background(Color(UIColor.secondarySystemBackground))
            }
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}




private struct howAreYouFeeling: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Label("How do you feel right now?", systemImage: "sun.max.fill")
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding(.all, 10)
            
            HStack() {
                
                Button(action: {}) {
                    Text("1")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                
                Spacer()
                
                Button(action: {}) {
                    Text("2")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                
                Spacer()
                
                Button(action: {}) {
                    Text("3")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                
                Spacer()
                
                Button(action: {}) {
                    Text("4")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                
                Spacer()
                
                Button(action: {}) {
                    Text("5")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                
            }
            .padding([.leading, .trailing], 15)
            .padding(.top, 5)
            .padding(.bottom, 25)
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
            DataUIView()
        } label: {
            VStack(alignment: .leading) {
                
                HStack {
                    Label("Stress Levels", systemImage: "brain.head.profile")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    .padding([.horizontal, .top], 10)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(UIColor.systemGray4))
                        .padding([.horizontal, .top], 10)
                }
                
                
                Text("Your stress levels today are higher than usual.")
                    .font(.headline)
                    //.fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.label))
                    .padding(.horizontal, 10)
                    .padding(.top, 1)
                    .multilineTextAlignment(.leading)
                
                Divider()
                    .padding(.horizontal, 10)
                    .padding(.bottom, 25)
                
                Text("Test")
                
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
        
    }
}






struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}

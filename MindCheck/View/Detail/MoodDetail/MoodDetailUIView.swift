//
//  MoodDetailUIView.swift
//  MindCheck
//
//  Created by Josian van Efferen on 28/03/2023.
//

import SwiftUI

struct MoodDetailUIView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("Hello, World")
                    Spacer().frame(minHeight: 20)
                }
                .navigationTitle("Mood")
                .padding(.horizontal, 20)
                .padding(.top, 20.0)
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}

struct MoodDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        MoodDetailUIView()
    }
}

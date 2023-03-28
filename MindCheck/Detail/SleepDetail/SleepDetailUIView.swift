//
//  SleepDetailUIView.swift
//  MindCheck
//
//  Created by Josian van Efferen on 28/03/2023.
//

import SwiftUI

struct SleepDetailUIView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("Hello, World")
                    Spacer().frame(minHeight: 20)
                }
                .navigationTitle("Sleep")
                .padding(.horizontal, 20)
                .padding(.top, 20.0)
                //.padding(.bottom, 20)
                .background(Color(UIColor.secondarySystemBackground))
            }
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}

struct SleepDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        SleepDetailUIView()
    }
}

//
//  ContentView.swift
//  NetworkCallSwift
//
//  Created by Daniel Attali on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding()
        .background(.red)
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    ContentView()
}

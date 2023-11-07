//
//  SearchView.swift
//  NetworkCallSwift
//
//  Created by Daniel Attali on 11/7/23.
//

import SwiftUI

struct SearchView: View {
    @State private var name: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("User Name", text: $name)
                } header : {
                    Text("github user name")
                } footer: {
                    NavigationLink(destination: GitHubUserView(name)) {
                        Label("Search" , systemImage: "magnifyingglass" )
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                
            }
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}

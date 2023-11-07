//
//  TabBarView.swift
//  NetworkCallSwift
//
//  Created by Daniel Attali on 11/7/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Search" , systemImage: "magnifyingglass" )
                }
            
//            GitHubUserView()
            SearchView()
                .tabItem {
                    Label("Favorite" , systemImage: "star.fill" )
                }
        }
    }
}

#Preview {
    TabBarView()
}

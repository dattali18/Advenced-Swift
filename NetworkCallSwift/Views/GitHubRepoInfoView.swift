//
//  RepoInfoView.swift
//  NetworkCallSwift
//
//  Created by Daniel Attali on 11/6/23.
//

import SwiftUI

struct GitHubRepoInfoView: View {
    var repo: GitHubRepo?
    @State private var languages: [(String, Int)] = []
    
    var body: some View {
        Form {
            Section("Langauges") {
                ForEach(self.languages, id: \.0) { key, count in
                    Text(key)
                        .badge(count)
                }
            }
        }
        .navigationTitle(repo?.name ?? "Repo Name")
        .task {
            do {
                let languages = try await GitHubUserViewModel.getLanguages(repo?.languages_url ?? "")
                self.languages = Array(languages.keys).map { ($0, languages[$0] ?? 0) }
            } catch {
                print("there was some error")
            }
        }
    }
}

#Preview {
    GitHubRepoInfoView()
}

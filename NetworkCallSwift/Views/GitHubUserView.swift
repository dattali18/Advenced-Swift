//
//  NetworkView.swift
//  NetworkCallSwift
//
//  Created by Daniel Attali on 11/6/23.
//

import SwiftUI

struct GitHubUserView: View {
    @StateObject var viewModel = GitHubUserViewModel()
    var userName: String
    
    init(_ userName: String) {
        self.userName = userName
    }
    
    var body: some View {
        List {
            Section {
                ForEach(viewModel.repos, id:\.name) { repo in
                    NavigationLink(destination: GitHubRepoInfoView(repo: repo)) {
                        Text(repo.name)
                    }
                }
            } header : {
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: viewModel.user?.avatar_url ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(.circle)
                    } placeholder: {
                        Circle()
                            .foregroundStyle(.gray)
                    }
                    .frame(width: 40, height: 40)
                    
                    
                    Text(viewModel.user?.login ?? "")
                        .font(.title3)
                        .textCase(nil)
                }
            }
        }
        .navigationTitle(viewModel.user?.name ?? "")
        .task {
            do {
                viewModel.user = try await viewModel.getUser(self.userName)
                viewModel.repos = try await viewModel.getRepos(self.userName)
            } catch {
                print("there was some error")
            }
        }
    }
}

//#Preview {
//    GitHubUserView()
//}

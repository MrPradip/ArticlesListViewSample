//
//  ArticlesListLocalView.swift
//  ArticlesListViewSample
//
//  Created by Pradip Kumar on 05/03/25.
//
import SwiftUI

struct ArticleListLocalView: View {
    @StateObject var viewModel = ArticleViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading articles...")
                } else if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                        Button("Retry") {
                            viewModel.fetchArticlesFromLocalJSON()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else {
                    List(viewModel.articles, id: \.title) { article in
                        ArticleLocalRow(article: article)
                    }
                }
            }
            .onAppear {
                viewModel.fetchArticlesFromLocalJSON()
            }
            .navigationTitle("Local Articles")
        }
    }
}

struct ArticleLocalRow: View {
    let article: Article

    var body: some View {
        HStack {
            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipped()
                            .cornerRadius(8)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray)
            }

            VStack(alignment: .leading) {
                Text(article.title ?? "")
                    .font(.headline)
                Text(article.source?.name ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListLocalView()
    }
}


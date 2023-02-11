//
//  ToastMessageView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct ToastMessageView: View {

    private let client = MovieClient()
    @State var movies = [Movie]()
    
    var body: some View {
        ZStack {
            if movies.isEmpty {
                EmptyViewPlaceholder(type: .movies)
                    .opacity(Constants.Misc.opacityEmptyView)
                
            } else {
                List(movies, id: \.backdrop_path) { movie in
                    Text(movie.title ?? "NO title")
                }
            }
        }
        .onAppear {
            client.getFeed(from: .topRated) { result in
                switch result {
                case .success(let movieFeedResult):
                    
                    guard let movieResults = movieFeedResult?.results else { return }
                    print(movieResults)
                    
                    movies = movieResults
                    
                case .failure(let error):
                    print("the error \(error)")
                }
            }
        }
    }
}

struct ToastMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ToastMessageView()
    }
}

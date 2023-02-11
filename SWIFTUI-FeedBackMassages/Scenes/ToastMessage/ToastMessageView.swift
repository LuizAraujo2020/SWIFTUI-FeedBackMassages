//
//  ToastMessageView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct ToastMessageView: View {
    @EnvironmentObject var appState: AppState
    @State var movies = [Movie]()
    @State private var showMessage = false
    
    private let client = MovieClient()
    
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
            
//            if let msg = appState.message, showMessage {
//                FeedbackMessageView(showMessage: $showMessage, message: msg)
//            }
            
            if showMessage {
                FeedbackMessageView(showMessage: $showMessage, message: appState.message!)
            }
        }
        .onAppear {
            /// Forces a error
            if Bool.random() {
                presentMessage(message: .init(type: .allCases.randomElement()!, message: Constants.Texts.loremSmall))
                
            } else {
                showMessage      = false
                appState.message = nil
                
                client.getFeed(from: .nowPlaying) { result in
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
        } // End: onAppear
//        .onChange(of: appState.message) { newValue in
//            showMessage = newValue != nil
////            if newValue != nil {
////                showMessage = true
////            }
//
//            print("🚨 showMessage = newValue != nil: \(showMessage)")
//        }
        .onDisappear {
            dismissMessage()
        }
    }
    
    private func presentMessage(message: FeedbackMessage) {
        
        appState.message = nil
        appState.message = message
        showMessage = true
    }
    
    private func dismissMessage() {
        
        appState.message = nil
        showMessage = false
    }
}

struct ToastMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ToastMessageView()
    }
}

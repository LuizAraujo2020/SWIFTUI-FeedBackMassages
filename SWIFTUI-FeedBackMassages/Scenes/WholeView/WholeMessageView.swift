//
//  WholeMessageView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct WholeMessageView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var wholeMessageViewModel = WholeMessageViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                if wholeMessageViewModel.listUsers.isEmpty {
                    EmptyViewPlaceholder(type: .user)
                        .opacity(0.5)
                    
                } else {
                    
                    List(wholeMessageViewModel.listUsers, id: \.self) { user in
                        Text(user.name)
                    }
                }
                
                // MARK: Buttons
                /// Usually the fetch would be on the `onAppear` or `.task`...
                /// Made this way to chose wether would throw an error or not.
                FetchOptionsView(actionWithoutError: {
                    Task {
//                    try? await Task.sleep(for: .seconds(2)) // timer to fake the network request
                        loadUsers(withError: false) // calling the fake function with error
                    }
                    
                }, actionWithError: {
                    
                    loadUsers(withError: true)
                })
            }
            .padding(.bottom)
            
            if let error = wholeMessageViewModel.userError { // << error handling here
                ErrorView(errorTitle: error.description) {
                    loadUsers(withError: false)
                }
                .ignoresSafeArea()
            }
            
            if appState.isBusy {
                LoadingView()
            }
        }
//        .onChange(of: wholeMessageView.userError) { newValue in
//            showError = newValue == nil ?  false : true
//        }
        .animation(.easeInOut, value: appState.isBusy)
        .animation(.easeInOut, value: appState.showCard)
        .animation(.easeInOut, value: wholeMessageViewModel.listUsers)
    }
    
    private func loadUsers(withError: Bool) {
        
        Task {
            appState.isBusy = true
            
            try? await Task.sleep(for: .seconds(Constants.Animations.randomDuration)) // timer to fake the network request
            await wholeMessageViewModel.loadUsers(withError: withError)
            
            appState.isBusy = false
        }
    }
}

struct WholeView_Previews: PreviewProvider {
    static var previews: some View {
        WholeMessageView()
            .environmentObject(AppState())
    }
}

//
//  WholeMessageView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct WholeMessageView: View {
    
    @StateObject var wholeMessageView = WholeMessageViewModel()
    
    var body: some View {
        VStack {
            if wholeMessageView.listUsers.isEmpty {
                EmptyViewPlaceholder(type: .user)
                    .opacity(0.5)
                
            } else {
                ZStack {
                    List(wholeMessageView.listUsers, id: \.self) { user in
                        Text(user)
                    }
                    
                    if let error = wholeMessageView.userError { // << error handling here
                        ErrorView(errorTitle: error.description)
                    }
                }
                .task {
                    try? await Task.sleep(for: .seconds(2)) // timer to fake the network request
                    await wholeMessageView.loadUsers(withError: true) // calling the fake function with error
                }
            }
            
            // MARK: Buttons
            /// Usually the fetch would be on the `onAppear` or `.task`...
            /// Made this way to chose wether would throw an error or not.
            FetchOptionsView(actionWithoutError: {
                Task {
                    try? await Task.sleep(for: .seconds(2)) // timer to fake the network request
                    await wholeMessageView.loadUsers(withError: false) // calling the fake function with error
                }
                
            })
            {
                Task {
                    try? await Task.sleep(for: .seconds(2)) // timer to fake the network request
                    await wholeMessageView.loadUsers(withError: true) // calling the fake function with error
                }
            }
        }
        .padding(.bottom)
    }
}

struct WholeView_Previews: PreviewProvider {
    static var previews: some View {
        WholeMessageView()
    }
}

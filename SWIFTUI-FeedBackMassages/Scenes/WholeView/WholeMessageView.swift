//
//  WholeMessageView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct WholeMessageView: View {
    
    @StateObject var wholeMessageViewModel = WholeMessageViewModel()
//    @State var showError = false
    
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
                        await wholeMessageViewModel.loadUsers(withError: false) // calling the fake function with error
                    }
                    
                }, actionWithError: {
                    Task {
                        await wholeMessageViewModel.loadUsers(withError: true) // calling the fake function with error
                    }
                })
            }
            .padding(.bottom)
            
            if let error = wholeMessageViewModel.userError { // << error handling here
                ErrorView(errorTitle: error.description)
                
            }
        }
//        .onChange(of: wholeMessageView.userError) { newValue in
//            showError = newValue == nil ?  false : true
//        }
    }
}

struct WholeView_Previews: PreviewProvider {
    static var previews: some View {
        WholeMessageView()
    }
}

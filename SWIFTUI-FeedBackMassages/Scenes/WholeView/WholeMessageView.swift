//
//  WholeMessageView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct WholeMessageView: View {
    
    @ObservedObject var usersViewModel: UsersViewModel
    
    var body: some View {
        VStack {
            if usersViewModel.listUsers.isEmpty {
                EmptyViewPlaceholder(type: .user)
                    .opacity(0.5)
                
            } else {
                ZStack {
                    List(usersViewModel.listUsers, id: \.self) { user in
                        Text(user)
                    }
                    
                    if let error = usersViewModel.userError { // << error handling here
                        ErrorView(errorTitle: error.description, usersViewModel: usersViewModel)
                    }
                }
                .task {
                    try? await Task.sleep(for: .seconds(2)) // timer to fake the network request
                    await usersViewModel.loadUsers(withError: true) // calling the fake function with error
                }
            }
            
            // MARK: Buttons
            VStack {
                Text("Fetch")
                    .font(.title)
                
                HStack {
                    CompButtonRegular(title: "No error", color: .green) { }
                    CompButtonRegular(title: "Random error", color: .red) { }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.ultraThickMaterial)
                    .shadow(radius: 12)
            )
        }
    }
}

struct WholeView_Previews: PreviewProvider {
    static var previews: some View {
        WholeMessageView(usersViewModel: UsersViewModel())
    }
}

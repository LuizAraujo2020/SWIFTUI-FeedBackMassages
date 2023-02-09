//
//  ErrorView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct ErrorView: View {

    let errorTitle: String
    @ObservedObject var usersViewModel: UsersViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.red)
            .overlay {
                
                VStack {
                    Text(errorTitle)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Button("Reload Users") {
                        Task {
                            await usersViewModel.loadUsers(withError: false)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                
            }
    }
    
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorTitle: "Error", usersViewModel: UsersViewModel())
    }
}

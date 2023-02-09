//
//  WholeMessageViewModel.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import Foundation

final class WholeMessageViewModel: ObservableObject {
    
    @Published var listUsers = [UserElement]()
    @Published var userError: UserError? = nil
    
    @MainActor
    func loadUsers(withError: Bool) async {
        if withError {
            userError = UserError.failedLoading
            
        } else {
            
            let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
            
            userError = nil
            
            APIService.shared.loadData { (books) in
                self.listUsers = books
            }
        }
    }
}

enum UserError: Error {
    case failedLoading
    
    var description: String {
        switch self {
        case .failedLoading:
            return "Sorry, we couldn't retrieve users. \n Try again later. ☹️"
        }
    }
}

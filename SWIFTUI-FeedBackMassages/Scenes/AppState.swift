//
//  AppState.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import Foundation

@MainActor
class AppState: ObservableObject {
//    /// Navigation
//    @Published var path = NavigationPath()
    
//    /// State of user
//    @Published var isLoggedIn = false
    
    @Published var isBusy = false
    
    /// User Feedback
//    @Published var showMessage = false
    var message: FeedbackMessage?
    
//    /// Signing With Apple
//    var signInWithAppleViewModel = SignInWithAppleViewModel()
}

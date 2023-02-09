//
//  ContentView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var usersViewModel = UsersViewModel()
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            WholeMessageView(usersViewModel: usersViewModel)
                .tabItem {
                    Label("Whole", systemImage: "photo.on.rectangle")
                }
            
            AlertMessageView()
                .tabItem {
                    Label("Alert", systemImage: "exclamationmark.triangle.fill")
                }
            
            ToastMessageView()
                .tabItem {
                    Label("Alert", systemImage: "exclamationmark.triangle.fill")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

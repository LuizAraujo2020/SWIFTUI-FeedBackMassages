//
//  SWIFTUI_FeedBackMassagesApp.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

@main
struct SWIFTUI_FeedBackMassagesApp: App {
    var body: some Scene {
        WindowGroup {
            
                TabView {
                    ContentView()
                        .tabItem {
                            Label("Menu", systemImage: "list.dash")
                        }
                    
                    WholeMessageView()
                        .tabItem {
                            Label("Whole", systemImage: "photo.on.rectangle")
                        }
                    
                    AlertMessageView()
                        .tabItem {
                            Label("Alert", systemImage: "exclamationmark.triangle.fill")
                        }
                    
                    ToastMessageView()
                        .tabItem {
                            Label("Toast", systemImage: "envelope.arrow.triangle.branch.fill")
                        }
                }
        }
    }
}
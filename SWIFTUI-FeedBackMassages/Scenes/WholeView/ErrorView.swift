//
//  ErrorView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct ErrorView: View {
    
    let errorTitle: String
    let perform: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.gray)
            .overlay {
                
                VStack {
                    Text(errorTitle)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    CompButtonRegular(title: "Reload Users",
                                      color: .red) {
                        perform()
                    }
                }
                
            }
    }
    
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorTitle: "Error") { }
    }
}

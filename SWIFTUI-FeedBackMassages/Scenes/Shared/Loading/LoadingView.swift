//
//  LoadingView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct LoadingView: View {
    private let sizeStandard = CGFloat(100)
    
    // MARK:- views
    
    var body: some View {
        
        GeometryReader { geo in
            /// The smallest dimension.
            let smallest = geo.size.width <= geo.size.height ? geo.size.width : geo.size.height
            /// The size of the content.
            let contentSize = CGSize(width: smallest * 0.6, height: smallest * 0.8)
            
            ZStack {
                createBackground(size: contentSize.width)
                
                createGraphic(size: contentSize)
                
                createText(size: contentSize)
            }
            .frame(width: contentSize.width, height: contentSize.height)
            .position(x: geo.size.width * 0.5, y: geo.size.height * 0.5)
        }
    }
    
    @ViewBuilder
    private func createBackground(size: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: size * 0.1)
            .foregroundStyle(Color.darkModeDark)
            .opacity(0.8)
    }
    
    @ViewBuilder
    private func createGraphic(size: CGSize) -> some View {
        VStack {
            LottieView(lottieFile: "loading")
                .frame(width: size.width)
                .offset(y: size.height * -0.1)
                .clipped()
            
        }
    }
    
    @ViewBuilder
    private func createText(size: CGSize) -> some View {
        Text("Loading")
            .font(.system(size: size.width * 0.15, weight: .heavy, design: .rounded))
            .foregroundColor(Color.textLightGray)
            .offset(y: size.height * 0.2)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .background(.red)
    }
}

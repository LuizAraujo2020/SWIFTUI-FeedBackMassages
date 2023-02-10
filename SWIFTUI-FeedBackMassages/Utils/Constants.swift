//
//  Constants.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import Foundation

struct Constants {
    struct Animations {
        static var duration       = Double(2.0)
        static var randomDuration = Double.random(in: 0.25..<duration)
        static var startDegrees   = Double(0.0)
        static var endDegrees     = Double(1080.0)
        
        static let fileNameloading = "loading"
    }
}

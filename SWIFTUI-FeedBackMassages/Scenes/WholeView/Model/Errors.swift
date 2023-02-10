//
//  Errors.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

enum VendingMachineError: Error, MessageCardfiable {
    var successful: Bool {
        false
    }
    
    var symbol: Image {
        switch self {
        case .invalidSelection: return Image(systemName: "cursorarrow.and.square.on.square.dashed")
        case .insufficientFunds(coinsNeeded: _): return Image(systemName: "dollarsign.circle")
        case .outOfStock: return Image(systemName: "shippingbox")
        }
    }
    
    var message: String {
        switch self {
        case .invalidSelection: return "Invalid selection, make sure you have selected the right ones."
        case .insufficientFunds(coinsNeeded: _): return "Damn, you're broke, go get some job already."
        case .outOfStock: return "Too  late, we've sold every shit."
        }
    }
    
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

protocol MessageCardfiable {
    var successful: Bool { get }
    var symbol: Image { get }
    var message: String { get }
}

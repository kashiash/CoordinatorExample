//
//  NavigationStep.swift
//  CoordinatorExample
//
//  Created by Jacek Kosinski U on 09/05/2024.
//

import SwiftUI

@Observable
class NavigationStep {
    var isPresented = false
    var isCovered = false
    var isPushed = false

    func present() {
        isPresented.toggle()
    }
    func cover() {
        isCovered.toggle()
    }
    func push() {
        isPushed.toggle()
    }
}

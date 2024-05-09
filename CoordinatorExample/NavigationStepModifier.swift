//
//  NavigationStepModifier.swift
//  CoordinatorExample
//
//  Created by Jacek Kosinski U on 09/05/2024.
//

import SwiftUI

struct NavigationStepModifier<Destination  : View> : ViewModifier {

    @Binding var navigationStep: NavigationStep
    @ViewBuilder var destination: () -> Destination
    var onDismiss: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $navigationStep.isPresented) {
                onDismiss?()
            } content: {
                destination()
            }
            .fullScreenCover(isPresented: $navigationStep.isCovered) {
                onDismiss?()
            }  content: {
                destination()
            }
            .push(isPresented: $navigationStep.isPushed) {
                onDismiss?()
            }  destination: {
                destination()
            }


    }
}

extension View {
    func navigationStep<Destination: View> ( _ navigationStep:
                                             Binding<NavigationStep>, onDismiss: (()-> Void)? = nil,
                                             @ViewBuilder destination: @escaping() -> Destination) ->
    some View {
        self.modifier(NavigationStepModifier(navigationStep: navigationStep, destination: destination, onDismiss: onDismiss))
    }
}

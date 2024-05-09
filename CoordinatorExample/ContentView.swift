//
//  ContentView.swift
//  CoordinatorExample
//
//  Created by Jacek Kosinski U on 09/05/2024.
//

import SwiftUI

struct ContentView: View {

    @State private var destinationViewStep = NavigationStep()
    var body: some View {
        List {
            Button("Sheet") {
                destinationViewStep.present()
            }
            Button("Cover") {
                destinationViewStep.cover()
            }
            Button("Link") {
                destinationViewStep.push()
            }
        }
        .navigationStep($destinationViewStep) {
            print("dismissed")
        } destination: {
            DestinationView()
        }
    }
}

#Preview {
    ContentView()
}

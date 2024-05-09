//
//  DestinationsView.swift
//  CoordinatorExample
//
//  Created by Jacek Kosinski U on 09/05/2024.
//

import SwiftUI

struct DestinationView: View {

    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text("Hello, DestinationView!")
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    DestinationView()
}

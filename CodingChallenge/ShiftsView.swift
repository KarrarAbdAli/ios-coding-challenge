//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    // MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                Text("The main view should include a list of shifts. If you tap on a shift it should show a modal shift details view. Be creative and show us your best work.")
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .navigationTitle("Shifts")
            .onAppear {
                ApiClient().fetchShifts()
            }
        }
    }
}

// MARK: - Preview
struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView()
    }
}

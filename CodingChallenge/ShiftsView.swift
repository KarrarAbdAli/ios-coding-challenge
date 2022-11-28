//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    // MARK: - Variables
    @StateObject private var viewModel = ViewModel()

    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.shifts, id: \.date) { shift in
                    Text(shift.date)
                }
            }
            .navigationTitle("Shifts")
            .onAppear {
                viewModel.loadShifts()
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

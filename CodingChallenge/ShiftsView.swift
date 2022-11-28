//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    // MARK: - Variables
    @EnvironmentObject var apiClient: ApiClient

    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
//                List {
                    VStack {
                        ForEach(apiClient.shifts, id: \.id) { shift in
                            VStack {
                                Text(shift.date)
                            }
                        }
                    }
//                }
            }
            .navigationTitle("Shifts")
            .onAppear {
                apiClient.fetchShifts()
            }
        }
    }
}

// MARK: - Preview
struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView()
            .environmentObject(ApiClient())
    }
}

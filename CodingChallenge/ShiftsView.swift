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
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.shifts, id: \.date) { shift in
                        cellView(date: shift.date)
                            .onAppear {
                                viewModel.loadShifts()
                            }
                    }
                    if viewModel.isLoading {
                        ProgressView()
                            .padding(.vertical)
                    }
                }
                
            }
            .padding()
            .navigationTitle("Shifts")
            .onAppear {
                viewModel.loadShifts()
            }
           
        }
    }

    // MARK: - SubViews
    private func cellView(date: String) -> some View {
        Rectangle()
            .frame(height: 60)
            .foregroundColor(.white)
            .border(.black, width: 3)
            .overlay(
                HStack {
                    Image(systemName: "calendar")
                        .frame(width: 60, height: 60)
                    Text(date)
                        .font(.title)
                    Spacer()
                }
            )
    }
}

// MARK: - Preview
struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView()
    }
}

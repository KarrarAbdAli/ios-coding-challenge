//
//  ShiftsDetails.swift
//  CodingChallenge
//
//  Created by Karrar Abd Ali on 28/11/2022.
//

import SwiftUI

struct ShiftsDetails: View {
    // MARK: - Variables
    var shifts: [Shift]

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(shifts, id:\.shiftID) { shift in
                            ShiftCell(shift: shift)
                                .cornerRadius(12)
                        }
                    }
                }
            }
        }
    }

    // MARK: - Subviews
   
}

struct ShiftsDetails_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsDetails(shifts: [])
    }
}

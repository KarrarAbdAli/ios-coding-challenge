//
//  ShiftCell.swift
//  CodingChallenge
//
//  Created by Karrar Abd Ali on 28/11/2022.
//

import SwiftUI

struct ShiftCell: View {
    var shift: Shift

    var body: some View {
        ZStack {
            shift.shiftKind.shiftColor().ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    idView
                    startEndDatesView
                    covidView
                    shiftKindView
                    distanceView
                    facilityView
                    skillsView
                    localizedSpecialtyView
                }
                .padding()
            }
        }
    }

    // MARK: - subViews
    private var idView: some View {
        HStack {
            Spacer()
            Text("id: \(shift.shiftID)")
                .font(.title3)
        }
    }

    private var startEndDatesView: some View {
        VStack(alignment: .leading) {
            Text("Start: \(shift.normalizedStartDateTime)")
            Text("Start: \(shift.normalizedEndDateTime)")
        }
    }

    private var covidView: some View {
        Text("COVID: \(shift.covid ? "Yes" : "No")")
    }

    private var shiftKindView: some View {
        Text("Shift Kind: \(shift.shiftKind.rawValue)")
    }

    private var distanceView: some View {
        Text("Distance: \(shift.withinDistance) Miles")
    }

    private var facilityView: some View {
        HStack {
            Text("Facility name: \(shift.facilityType.name.rawValue)")
        }
    }

    private var skillsView: some View {
        VStack(alignment: .leading) {
            Text("Skill name: \(shift.skill.name.rawValue)")
        }
    }

    private var localizedSpecialtyView: some View {
        VStack(alignment: .leading) {
            Text("Specialty name: \(shift.localizedSpecialty.name.rawValue)")
            Text("abbreviation: \(shift.localizedSpecialty.abbreviation.rawValue)")
            Text("specialty: \(shift.localizedSpecialty.specialty.name.rawValue)")
        }
    }

}

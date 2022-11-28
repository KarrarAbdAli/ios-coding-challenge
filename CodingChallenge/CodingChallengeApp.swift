//
//  CodingChallengeApp.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

@main
struct CodingChallengeApp: App {
    var apiClient = ApiClient()

    var body: some Scene {
        WindowGroup {
            ShiftsView()
                .environmentObject(apiClient)
        }
    }
}

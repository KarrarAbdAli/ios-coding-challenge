//
//  ShiftsViewModel.swift
//  CodingChallenge
//
//  Created by Karrar Abd Ali on 28/11/2022.
//

import Foundation

extension ShiftsView {
    @MainActor
    final class ViewModel: ObservableObject {

        // MARK: - Properties

        @Published private(set) var shifts: [Datum] = []

        // MARK: - Dependencies

        private let apiClient: ApiClientType

        // MARK: - Lifecycle

        init(apiClient: ApiClientType = ApiClient()) {
            self.apiClient = apiClient
        }

        // MARK: - Methods


        func loadShifts() {
            apiClient.fetchShifts { [weak self] result in
                guard let self = self else { return }

                switch result {
                case .success(let data):
                    self.shifts = data
                case .failure(let error):
                    print(error)
                    // TODO: Handle errors
                }
            }
        }
    }
}

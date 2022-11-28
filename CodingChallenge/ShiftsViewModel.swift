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
        @Published private(set) var isLoading = false
        // MARK: - Dependencies
        private let apiClient: ApiClientType

        // MARK: - Lifecycle
        init(apiClient: ApiClientType = ApiClient()) {
            self.apiClient = apiClient
        }

        // MARK: - Methods
        func loadShifts() {
            isLoading = true
            apiClient.fetchShifts { [weak self] result in
                self?.isLoading = false
                guard let self = self else { return }

                switch result {
                case .success(let shifts):
                    self.shifts.append(contentsOf: shifts)
                case .failure(let error):
                    print(error)
                    // TODO: Handle errors
                }
            }
        }
    }
}

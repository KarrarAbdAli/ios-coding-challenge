//
//  ApiClient.swift
//  CodingChallenge
//
//  Created by Karrar Abd Ali on 28/11/2022.
//

import Foundation
import SwiftUI

protocol ApiClientType {
    func fetchShifts(completion: @escaping (Swift.Result<[Datum], Error>) -> Void)
}

class ApiClient: ApiClientType, ObservableObject {
    private var startDate: Date?
    private var endDate: Date?

    // MARK: - Main Mehtods

    func fetchShifts(completion: @escaping (Swift.Result<[Datum], Error>) -> Void) {
        guard let shiftsBaseURL = URL.shiftsBaseURL,
              let url = getUrl(url: shiftsBaseURL) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpMethod = "GET"


        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    let decodedShifts = try JSONDecoder().decode(Result.self, from: data)
                    let shifts = decodedShifts.data.filter {
                        guard let shifts = $0.shifts else {
                            return false
                        }
                        return !shifts.isEmpty
                    }
                    completion(.success(shifts))
                } catch let error {
                    print("Error decoding: ", error)
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }

    // MARK: - Private Methods
    
    private func getUrl(url: URL) -> URL? {
        var startDateString = ""
        var endDateString = ""
        if startDate == nil, endDate == nil {
            let date = Date()
            startDate = date
            endDate = date.oneWeekAfter()
        } else {
            startDate = endDate
            endDate = endDate?.oneWeekAfter()
        }
        startDateString = startDate?.shiftDateFormat() ?? ""
        endDateString = endDate?.shiftDateFormat() ?? ""
        let type = "week"
        let address = "Dallas, TX".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""

        var components = URLComponents(string: url.absoluteString)
        components?.queryItems = [
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "start", value: startDateString),
            URLQueryItem(name: "end", value: endDateString),
            URLQueryItem(name: "address", value: address)
        ]
        return components?.url
    }
}

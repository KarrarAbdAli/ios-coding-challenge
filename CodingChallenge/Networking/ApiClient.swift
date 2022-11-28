//
//  ApiClient.swift
//  CodingChallenge
//
//  Created by Karrar Abd Ali on 28/11/2022.
//

import Foundation
import SwiftUI

protocol ApiClientType {
    func fetchShifts()
}

class ApiClient: ApiClientType, ObservableObject {
    @Published var shifts: [Datum] = []

    // MARK: - Main Mehtods
    func fetchShifts() {
        guard let shiftsBaseURL = URL.shiftsBaseURL,
              let url = getUrl(url: shiftsBaseURL) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpMethod = "GET"

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8), response, error)
            DispatchQueue.main.async {
                do {
                    let decodedShifts = try JSONDecoder().decode(Result.self, from: data)
                    self.shifts = decodedShifts.data
                } catch let error {
                    print("Error decoding: ", error)
                }
            }
            
        }
        
        dataTask.resume()
    }

    // MARK: - Private Methods
    private func getUrl(url: URL) -> URL? {
        let date = Date()
        let startDate = date.shiftDateFormat()
        print("$$$$ START DATE \(startDate)")
        let endDate = date.oneWeekAfter() ?? ""
        let type = "week"
        let address = "Dallas, TX".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""

        var components = URLComponents(string: url.absoluteString)
        components?.queryItems = [
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "start", value: startDate),
            URLQueryItem(name: "end", value: endDate),
            URLQueryItem(name: "address", value: address)
        ]
        print("### URL \(components?.url)")
        return components?.url
    }
    
}

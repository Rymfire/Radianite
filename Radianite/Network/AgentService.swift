//
//  DataJson.swift
//  Radianite
//
//  Created by ippon on 18/10/2022.
//

import Foundation

class AgentService {
    func getAgents() async -> Result<[Agent], Error> {
        let session = URLSession.shared

        guard let url = URL(string: Endpoint.AGENTS_URL) else {
            return .failure(NetworkError.invalidError)
        }

        do {
            let (data, _) = try await session.data(from: url)

            do {
                let json = try JSONDecoder().decode(AgentResponse.self, from: data)
                return .success(json.data)
            } catch {
                return .failure(NetworkError.invalidResponse)
            }

        } catch {
            return .failure(NetworkError.badRequest)
        }
    }
}

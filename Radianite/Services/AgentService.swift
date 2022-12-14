//
//  DataJson.swift
//  Radianite
//
//  Created by ippon on 18/10/2022.
//

import Foundation

class AgentService {
    func getAgents(completion: @escaping (Result<[Agent], Error>) -> Void) async {
        let session = URLSession.shared
        
        guard let url = URL(string: Endpoint.AGENTS_URL) else {
            print("Invalid URL")
            return
        }
        
        session.dataTask(with: url) { (data, response, error) in
            
            // TODO: Check statusCode == 2xx
            
            print("Data received")

            do {

                print("Decoding data")
                
                if let data = data {
                    let json = try JSONDecoder().decode(AgentResponse.self, from: data)
                    print("Data successfully decoded")
                    completion(.success(json.data))
                }
            } catch let jsonError {
                print("error: \(jsonError)")
                return
                // TODO: error handler -> convertion failed
            }
        }.resume()
    }
}

//
//  ViewModel.swift
//  Radianite
//
//  Created by ippon on 18/10/2022.
//

import Foundation

extension ContentView {
    class AgentsViewModel: ViewModel {
        @Published var agents = [Agent]()
        
        let service = AgentService()
        
        func getAgents() async {
            await service.getAgents { result in
                switch result {
                case .success(let agentsData):
                    self.agents = agentsData
                case .failure(_):
                    // error handling
                    return
                }
            }
        }
    }
}

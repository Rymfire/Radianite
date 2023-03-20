//
//  ViewModel.swift
//  Radianite
//
//  Created by ippon on 18/10/2022.
//

import Foundation

class AgentsViewModel: ViewModel { // TODO: tests
    @Published var agents = [Agent]()

    let service = AgentService()

    @MainActor
    func getAgents() async {
        let result = await service.getAgents()
        switch result {
        case .success(let agentsData):
            self.agents = agentsData
        case .failure(let error):
            print(error.localizedDescription)
            return
        }
    }
}

//
//  ContentView.swift
//  Radianite
//
//  Created by ippon on 17/10/2022.
//

import SwiftUI

struct AgentsView: View {
    @StateObject var viewModel = AgentsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach (viewModel.agents, id: \.self) { agent in
                        NavigationLink {
                            // TODO: Implement Presenter
                            AgentDetailsView(agent: agent)
                        } label: {
                            AgentListItem(agent: agent)
                        }
                    }
                }
            }
            .task {
                await viewModel.getAgents()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AgentsView()
    }
}

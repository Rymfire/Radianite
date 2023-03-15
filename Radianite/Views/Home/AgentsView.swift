//
//  ContentView.swift
//  Radianite
//
//  Created by ippon on 17/10/2022.
//

import SwiftUI

struct AgentsView: View {
    @StateObject var viewModel = AgentsView.AgentsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach (viewModel.agents, id: \.self) { agent in
                        NavigationLink {
                            AgentDetailsView(agent: agent)
                        } label: {
                            AgentListItem(agent: agent)
                        }
                    }
                }
            }
            .navigationTitle("Agents")
            .task {
                await viewModel.getAgents()
            }
            .toolbar {
                NavigationLink {
                    CameraView()
                } label: {
                    Image(systemName: "camera.fill")
                        .foregroundColor(.black)
                }
            }
        }

    }
}

struct AgentsView_Previews: PreviewProvider {
    static var previews: some View {
        AgentsView()
    }
}

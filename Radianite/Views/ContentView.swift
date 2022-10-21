//
//  ContentView.swift
//  Radianite
//
//  Created by ippon on 17/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentView.AgentsViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.agents, id: \.self) { agent in
                Text(agent.displayName)
            }
        }
        .task {
            await viewModel.getAgents()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

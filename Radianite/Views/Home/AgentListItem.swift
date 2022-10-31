//
//  AgentListItem.swift
//  Radianite
//
//  Created by ippon on 21/10/2022.
//

import SwiftUI

struct AgentListItem: View {
    let agent: Agent
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: agent.displayIcon)) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(agent.displayName).font(.headline)
                Text(agent.role.displayName)
            }
        }
    }
}

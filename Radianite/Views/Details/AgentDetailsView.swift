//
//  AgentDetails.swift
//  Radianite
//
//  Created by ippon on 24/10/2022.
//

import SwiftUI

struct AgentDetailsView: View {
    
    let agent: Agent
    @State var selectedAbilityTab: Tabs = .ability1

    var body: some View {
        GeometryReader { reader in
            ScrollView {
                VStack {
                    AgentHeader(agent: agent)
                        .frame(width: reader.size.width, height: 300)

                    AgentAvatar(agent: agent)
                        .offset(y: -100)

                    VStack(spacing: 16) {
                        VStack {
                            Text(agent.displayName).font(.largeTitle)
                            Text(agent.role.displayName).font(.subheadline)
                        }
                        Text(agent.description)
                    }
                        .offset(y: -100)
                        .padding(16)
                }
            }
        }
    }
}


//
//  AvatarHeader.swift
//  Radianite
//
//  Created by ippon on 25/10/2022.
//

import SwiftUI

struct AgentHeader: View {
    let agent: Agent
    
    var body: some View {
        Color(agent.displayName.removeCharacters(["/"]))
        .ignoresSafeArea(edges: .bottom)
        .mask(AsyncImage(url: URL(string: agent.background)))
    }
}

//
//  AgentAvatar.swift
//  Radianite
//
//  Created by ippon on 25/10/2022.
//

import SwiftUI

struct AgentAvatar: View {
    let agent: Agent
    
    var body: some View {
        AsyncImage(url: URL(string: agent.displayIcon)) { image in
            image
                .resizable()
                .frame(width: 200, height: 200)
                .background(Color.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(hex: "#000000"), lineWidth: 5))
        } placeholder: {
            ProgressView()
        }
    }
}

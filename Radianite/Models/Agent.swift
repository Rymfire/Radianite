//
//  Agent.swift
//  Radianite
//
//  Created by ippon on 18/10/2022.
//

import Foundation

struct AgentResponse: Model {
    let status: Int
    let data: [Agent]
}

struct Agent: Model, Identifiable {
    var id: String { self.uuid }
    let uuid: String
    let displayName: String
    let description: String
    let displayIcon: String
    let fullPortrait: String
    let background: String
    let backgroundGradientColors: [String]
    let role: Role
    let abilities: [Ability]
}

struct Role: Model {
    let displayName: String
    let description: String
}

struct Ability: Model {
    let displayName: String
    let description: String
    let displayIcon: String?
}

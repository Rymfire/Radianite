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

struct Agent: Model {
    let uuid: String
    let displayName: String
    let description: String
}

//
//  Protocol.swift
//  Radianite
//
//  Created by ippon on 18/10/2022.
//

import Foundation

protocol ViewModel: ObservableObject {}

protocol Model: Hashable, Codable {}

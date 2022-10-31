//
//  StringExt.swift
//  Radianite
//
//  Created by ippon on 31/10/2022.
//

import Foundation

extension String {
    func removeCharacters(_ characters: Set<Character>) -> String {
        var str = self
        str.removeAll(where: { characters.contains($0) })
        return str
    }
}

//
//  SpellTabs.swift
//  Radianite
//
//  Created by ippon on 02/11/2022.
//

import SwiftUI

enum Tabs: Int {
    case ability1 = 0
    case ability2 = 1
    case ability3 = 2
    case ultimate = 3
}

struct AbilitiesTabs: View {

    let abilities: [Ability]
    @Binding var activeTab: Tabs

    var body: some View {
        HStack (alignment: .center) {
            ForEach(abilities, id: \.self) { ability in
                createAbilityTab(using: ability)
            }
        }
        .padding()
    }

    func createAbilityTab(using ability: Ability) -> some View {
        return Button {
            // Switch to spell 1 name / desc
        } label: {
            ZStack {
                Color(.black)
                VStack {
                    if let iconURL = ability.displayIcon {
                        AsyncImage(url: URL(string: iconURL)) { image in
                            image
                                .resizable()
                                .frame(width: 40, height: 40)
                        } placeholder: {
                            ProgressView()
                        }
                    } else {
                        Color(.red)
                    }
                }
            }
        }
        .padding(4)
    }
}

let mockAbilities: [Ability] = [
    Ability(displayName: "Ability1", description: "Description1", displayIcon: "https://media.valorant-api.com/agents/707eab51-4836-f488-046a-cda6bf494859/abilities/ultimate/displayicon.png"),
    Ability(displayName: "Ability2", description: "Description2", displayIcon: "https://media.valorant-api.com/agents/707eab51-4836-f488-046a-cda6bf494859/abilities/ultimate/displayicon.png"),
    Ability(displayName: "Ability3", description: "Description3", displayIcon: "https://media.valorant-api.com/agents/707eab51-4836-f488-046a-cda6bf494859/abilities/ultimate/displayicon.png"),
    Ability(displayName: "Ability4", description: "Description4", displayIcon: "https://media.valorant-api.com/agents/707eab51-4836-f488-046a-cda6bf494859/abilities/ultimate/displayicon.png"),
]

struct AbilitiesTabs_Previews: PreviewProvider {
    @State static var selectedAbilityTab: Tabs = .ability1
    static var previews: some View {
        AbilitiesTabs(abilities: mockAbilities, activeTab: $selectedAbilityTab)
    }
}

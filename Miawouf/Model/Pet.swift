//
//  Pet.swift
//  Miawouf
//
//  Created by Lauriane Haydari on 07/08/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

struct Pet {
    var name: String?
    var phone: String?
    var hasMajority: Bool
    var race: String?
    var gender: Gender

    init(name: String?, phone: String?, hasMajority: Bool, race: String?, gender: Gender) {
        self.name = name
        self.hasMajority = hasMajority
        self.race = race
        self.gender = gender
    }

    enum Gender {
        case male, female
    }

    enum Status {
        case accepted, rejected(String)
    }

    var status: Status {
        if name == nil || name == "" {
            return .rejected("Vous n'avez pas indiqué votre nom !")
        }
        if phone == nil || phone == "" {
            return .rejected("Vous n'avez pas indiqué votre téléphone !")
        }
        if race == nil || race == "" {
            return .rejected("Quel est votre race ?")
        }
        if hasMajority == false {
            return .rejected("Les mineurs ne sont pas admis.")
        }
        return .accepted
    }

}

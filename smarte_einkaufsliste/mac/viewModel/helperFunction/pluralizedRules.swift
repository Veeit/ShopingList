//
//  pluralizedRules.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 31.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import Foundation
import GrammaticalNumber

func pluralizedRules() {
    let ruleKilo: GrammaticalNumberRule = .uncountable("Kilo")
    let ruleLiter: GrammaticalNumberRule = .uncountable("Liter")
    let ruleMal: GrammaticalNumberRule = .uncountable("Mal")
    let rulePackungen: GrammaticalNumberRule = .irregular("Packung", "Packungen")
    let ruleFlaschen: GrammaticalNumberRule = .irregular("Flasche", "Flaschen")
    let ruleStücke: GrammaticalNumberRule = .irregular("Stück", "Stücke")
    let ruleGläser: GrammaticalNumberRule = .irregular("Gläs", "Gläser")

    GrammaticalNumberRule.add(ruleKilo)
    GrammaticalNumberRule.add(ruleLiter)
    GrammaticalNumberRule.add(ruleMal)
    GrammaticalNumberRule.add(rulePackungen)
    GrammaticalNumberRule.add(ruleFlaschen)
    GrammaticalNumberRule.add(ruleStücke)
    GrammaticalNumberRule.add(ruleGläser)
}


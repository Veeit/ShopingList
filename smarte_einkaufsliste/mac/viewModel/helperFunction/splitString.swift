//
//  splitString.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 31.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import Foundation

// MARK: splitString
// splites the input to an array and sort it in the right order and add the categorie.
// Example: Apfel 1 -> 1 Stück Apfel
///input: String         | input product
///categorie: String  | input product categorie

func splitString(input: String, categorie: String) -> Array<Substring> {
    var array = input.split(separator: " ")
    for (index, part) in array.enumerated() {
        if Int(part) != nil {
            let element = array.remove(at: index)
            array.insert(element, at: 0)
        }
        if part == categorie {
            let element = array.remove(at: index)
            array.insert(element, at: 1)
        }
    }
    
    if array.count >= 2 {
        if array[1] != categorie {
            array.insert("\(categorie)", at: 1)
        }
        if Int(array[0]) == nil {
            array.insert("1", at: 0)
        }
    } else {
        array.insert("\(categorie)", at: 0)
        array.insert("1", at: 0)
    }

    return array
}

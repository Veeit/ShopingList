//
//  addItem.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 30.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import Foundation
import UIKit
import GrammaticalNumber

// MARK: addItem
// the function to add a item to coreData
/// newListItem: String     | the item that should be added

func addItem(newListItem: String) -> Int{
    var currentList: [ShopingListItem] = []
    let managedObjectContect = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var isDublicate = false
    
    do {
        currentList = try managedObjectContect.fetch(ShopingListItem.getAllItems())
    } catch {
        print("Fetching Failed")
        print(error)
        return 400
    }
    
    if newListItem != "" {
        let productSize    = predictProductSize(product: newListItem)
        var newFormated    = splitString(input: newListItem, categorie: productSize)
        let recommendation = predictRecomentation(product: newListItem)
        
        for item in currentList {
            var toUpdate = splitString(input: item.title!, categorie: productSize)
            if toUpdate[2] == newFormated[2] {
                if Int(toUpdate[0])! >= 2 {
                    toUpdate[1] = "\(String(toUpdate[1]).pluralized())"
                }
                isDublicate = true
                toUpdate[0] = "\(Int(toUpdate[0])! + Int(newFormated[0])!)"
                item.title  = toUpdate.joined(separator: " ")
            }
        }

        if isDublicate == false {
            let listItem = ShopingListItem(context: managedObjectContect)
            if Int(newFormated[0])! >= 2 {
                newFormated[1] = "\(String(newFormated[1]).pluralized())"
            }
            listItem.title          = newFormated.joined(separator: " ")
            listItem.createdAt      = Date()
            listItem.currentStatus  = "open"
            listItem.recommendation = recommendation
            listItem.id             = UUID.init()
        }

        do {
            try managedObjectContect.save()
            return 200
        } catch {
            print(error)
            return 304
        }
    } else {
        return 400
    }
}

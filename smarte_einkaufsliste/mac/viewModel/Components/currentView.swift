//
//  currentView.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 29.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import Foundation
import Combine
import Foundation

//MARK: CurrentView Compontent
// I needed to remove all the things :( the new beta borke it and the app is crased.
// so nothing interesstin is in here.


//func addNewItem(list: FetchedResults<ShopingListItem>, new: String, listItem: ShopingListItem) {
//    if new != "" {
//        let testModel      = loadTestMlModel(product: new)
//        let newFormated    = splitString(input: new, categorie: testModel)
//        let recommendation = predictRecomentation(product: new)
//
//        var isDublicate = false
//
//        for item in list {
//            var toUpdate = splitString(input: item.title!, categorie: testModel)
//            if toUpdate[2] == newFormated[2] {
//                isDublicate = true
//                toUpdate[0] = "\(Int(toUpdate[0])! + Int(newFormated[0])!)"
//                item.title  = toUpdate.joined(separator: " ")
//            }
//        }
//
//        if isDublicate == false {
//            listItem.title          = newFormated.joined(separator: " ")
//            listItem.createdAt      = Date()
//            listItem.currentStatus  = "open"
//            listItem.recommendation = recommendation
//            listItem.id             = UUID.init()
//        }
//    }
//}
//final class userInput: ObservableObject {
//    @Published var input = ""
//    @Published var score = 0
//}

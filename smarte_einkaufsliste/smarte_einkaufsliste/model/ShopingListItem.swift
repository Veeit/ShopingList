//
//  ToDoItem.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 19.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import Foundation
import CoreData

// ShopingListItem
// Connection to coreData

public class ShopingListItem:NSManagedObject, Identifiable {
    @NSManaged public var createdAt:      Date?
    @NSManaged public var title:          String?
    @NSManaged public var recommendation: String?
    @NSManaged public var currentStatus:  String?
    @NSManaged public var id:             UUID?
}

// getAllItems
// get all the list items from Core Data

extension ShopingListItem {
    static func getAllItems() -> NSFetchRequest<ShopingListItem> {
        let request:NSFetchRequest<ShopingListItem> = ShopingListItem.fetchRequest() as! NSFetchRequest<ShopingListItem>
        let sortDescription = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescription]
        
        return request
    }
}

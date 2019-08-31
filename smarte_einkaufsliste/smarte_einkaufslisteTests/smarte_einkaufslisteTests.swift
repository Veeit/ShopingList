//
//  smarte_einkaufslisteTests.swift
//  smarte_einkaufslisteTests
//
//  Created by Veit Progl on 18.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import XCTest
@testable import smarte_einkaufsliste

class smarte_einkaufslisteTests: XCTestCase {
    var newListItem:String = ""
    var itemCategory:String = ""
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        newListItem = "Brot"
        itemCategory = "Stück"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        newListItem = ""
    }

    func testPredictRecommendation() {
        // This is an test for the predictRecommendation ML
        let predicted = predictRecomentation(product: newListItem)
        XCTAssertTrue(predicted == "Brot Gut & Günsitg")
    }
    
    func testPredictProductSize() {
        // This is an test for the predictRecommendation ML
        let predicted = predictProductSize(product: newListItem)
        XCTAssertTrue(predicted == itemCategory)
    }
    
    func testSplitString() {
        let itemCategorieString = splitString(input: newListItem, categorie: itemCategory)
        print(itemCategorieString.joined(separator: " "))
        XCTAssertTrue(itemCategorieString.joined(separator: " ") == "1 Stück Brot")
    }
    
    func testSplitStringReversed() {
        let itemCategorieString = splitString(input: "Brot 1", categorie: itemCategory)
        print(itemCategorieString.joined(separator: " "))
        XCTAssertTrue(itemCategorieString.joined(separator: " ") == "1 Stück Brot")
    }
    
    func testSplitStringWithSize() {
        let itemCategorieString = splitString(input: "1 Stück Brot", categorie: itemCategory)
        print(itemCategorieString.joined(separator: " "))
        XCTAssertTrue(itemCategorieString.joined(separator: " ") == "1 Stück Brot")
    }
    
    func testSplitStringWithSizeReversed() {
        let itemCategorieString = splitString(input: "Brot 1 Stück", categorie: itemCategory)
        print(itemCategorieString.joined(separator: " "))
        XCTAssertTrue(itemCategorieString.joined(separator: " ") == "1 Stück Brot")
    }
    
    func testSplitStringWithWithWongSize() {
        let itemCategorieString = splitString(input: "1 Packung Brot", categorie: itemCategory)
        print(itemCategorieString.joined(separator: " "))
        XCTAssertTrue(itemCategorieString.joined(separator: " ") == "1 Stück Brot")
    }
    
    func testplural() {
        let product = "5 Brot"
        let productSize    = predictProductSize(product: product)
        var newFormated    = splitString(input: product, categorie: productSize)
        if Int(newFormated[0])! >= 2 {
            newFormated[1] = "\(String(newFormated[1]).pluralized())"
        }
        print(newFormated.joined(separator: " "))
        XCTAssertTrue(newFormated.joined(separator: " ") == "5 Stücke Brot")
    }
    
    func testpluralReversed() {
        let product = "5 Brot"
        let productSize    = predictProductSize(product: product)
        var newFormated    = splitString(input: product, categorie: productSize)
        if Int(newFormated[0])! >= 2 {
            newFormated[1] = "\(String(newFormated[1]).pluralized())"
        }
        XCTAssertTrue(newFormated.joined(separator: " ") == "5 Stücke Brot")
    }
    
    func testGetAllData() {
        var currentList: [ShopingListItem] = []
        let managedObjectContect = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            currentList = try managedObjectContect.fetch(ShopingListItem.getAllItems())
        } catch {
            print("Fetching Failed")
            XCTAssertTrue(false)
        }
        
        XCTAssertTrue(currentList != [])
    }
    
    func testDeleteItem() {
        var currentList: [ShopingListItem] = []
        let managedObjectContect = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            currentList = try managedObjectContect.fetch(ShopingListItem.getAllItems())
        } catch {
            XCTAssertTrue(true)
        }
        
        if addItem(newListItem: self.newListItem) != 200 {
            XCTAssertTrue(false)
        }
        
        for item in currentList {
            if item.title == newListItem {
                managedObjectContect.delete(item)
                do {
                    try managedObjectContect.save()
                    XCTAssertTrue(true)
                } catch {
                    XCTAssertTrue(false)
                }
            }
        }
    }
    
    func testAddItemToData() {
        let errorCode = addItem(newListItem: newListItem)
        XCTAssertTrue(errorCode == 200)
    }
    
    func testAddItemPluralReversed() {
        let errorCode = addItem(newListItem: "Brot 5 Stück")
        XCTAssertTrue(errorCode == 200)
    }
    
    func testAddItemWithPlural() {
        let errorCode = addItem(newListItem: "Brot 5 Stück")
        XCTAssertTrue(errorCode == 200)
    }

}

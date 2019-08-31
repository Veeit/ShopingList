//
//  currentLVItem.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 21.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import SwiftUI

//  MARK: List Title View and Edit
//  Shows your the Title and the edit mode to fix misspellings
/// item:     ShopingListItem  | The displayed Item from CoreData
/// editMode: Bool                 | Default is false, is used to show the edit mode
/// title:    String                     | Default is empy, is used to save the (new) title
struct currentLVItem: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var item:ShopingListItem
    @State var editMode = false
    @State var title    = ""
    
    // MARK:  EditItem Function
    fileprivate func editItem() {
        if self.editMode == false {
            self.editMode = true
            self.title = self.item.title!
        } else {
            self.editMode = false
            self.item.title = self.title
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
    
    var body: some View {
        HStack() {
            Button(action: {
                self.editItem()
            }){
                if self.editMode == false {
                    //MARK: Edit View
                    VStack(alignment: .leading) {
                        Text(self.item.title!)
                            .font(.headline)
                            .foregroundColor(Color.primary)
                        Text(self.item.recommendation!)
                            .font(.subheadline)
                            .foregroundColor(Color.primary)
                    }.animation(.easeOut)
                } else {
                    //MARK: Text View
                    HStack() {
                        TextField("edit Mode", text: $title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(.primary)
                        Text("done")
                    }
                }
            }.frame(height: 45)
            
        }
     }
}


//  MARK: Done View
//  Shows you the current state (checked or uncheked) of the item
/// item:     ShopingListItem  | The displayed Item from CoreData
/// isDone: Bool                    | default: false, is used to mark the state 
struct currentLVisDone: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @State var item:ShopingListItem
    @State var isDone = false
    
    //MARK: markAsDone func
    fileprivate func markAsDone() {
        self.isDone.toggle() // change the local state to update the view !! Important !!!
        self.item.currentStatus = self.item.currentStatus == "open" ? "close" : "open"
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
    }
    
    //MARK: Done View
    var body: some View {
        HStack() {
            Button(action: {
                self.markAsDone()
            }){
                Image(systemName: self.isDone ? "checkmark.square" : "square").animation(.easeOut)
                    .foregroundColor(.blue)
                    .imageScale(.large)
            }
        }
    }
}

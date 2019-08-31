//
//  currentList.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 21.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import SwiftUI


// MARK: CurrentList:
// the view displays your current list, and a quick add func.
// The view houses some sub views to edit, and make as done.
struct currentList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ShopingListItem.getAllItems()) var InetzListItems:FetchedResults<ShopingListItem>
    
    @State private var newListItem = ""
    @State private var isDublicate = false
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK:  Quick add func
            Section(header: Text("quick add").font(.headline).foregroundColor(Color.secondary)) {
                HStack() {
                    TextField("tf new", text: self.$newListItem)
                    Button(action: {
                        if self.newListItem != "" {
                            if addItem(newListItem: self.newListItem) != 200 {
                                print("error by addning item")
                            } else {
                                self.newListItem = ""
                            }
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                    }
                }
            }
            Divider()
            //MARK:  The list
            Section(header: Text("your list").font(.headline).foregroundColor(Color.secondary)) {
                GeometryReader { geometry in
                    Group {
                        ScrollView {
                            ForEach(self.InetzListItems) { listItem in
                                HStack() {
                                    // MARK: Delete func
                                    Button(action: {
                                        self.managedObjectContext.delete(listItem)

                                        do {
                                            try self.managedObjectContext.save()
                                        } catch {
                                            print(error)
                                        }
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.primary)
                                    }
                                    // MARK: SubViews
                                    Spacer().frame(width: 10)
                                    currentLVItem(item: listItem)
                                    Spacer()
                                    currentLVisDone(item: listItem, isDone: listItem.currentStatus == "open" ? false : true)
                                }.frame(width: geometry.size.width).animation(.easeOut)
                            }
                        }
                    }
                }
            }
            Spacer()
            
        }.navigationBarTitle(Text("your list"), displayMode: .large)
         .padding(25)
    }
}

struct currentList_Previews: PreviewProvider {
    static var previews: some View {
        currentList()
    }
}

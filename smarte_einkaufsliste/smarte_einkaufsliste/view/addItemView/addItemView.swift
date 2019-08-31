//
//  addItemView.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 29.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

// MARK: addItemView
// the add item view, lets the user add a new item to the list.
// has the option to display the predicts before suppmiting

struct addItemView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @State private var newListItem        = ""
    @State private var isDublicate        = false
    @State private var predictedCategorie = ""
    @State private var predictedProduct   = ""

    var body: some View {
        Form {
            //MARK: Add textField
            Section(header: Text("add title").font(.headline).foregroundColor(Color.secondary)) {
                HStack() {
                    TextField("tf new", text: $newListItem)
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
            Section() {
                //MARK: predictedProduct
                Button(action: {
                    if self.predictedProduct == "" && self.newListItem != "" {
                        self.predictedProduct = predictRecomentation(product: self.newListItem)
                    } else {
                        self.predictedProduct = ""
                    }
                }) {
                    HStack() {
                        Text("get best product")
                        Image(systemName: self.predictedProduct == "" ? "arrowtriangle.down.square" : "arrowtriangle.up.square")
                    }
                    
                }
                if self.predictedProduct != "" && self.newListItem != "" {
                    Text("\(self.predictedProduct)").animation(.linear)
                }
                
                //MARK:predictedCategorie
                Button(action: {
                    if self.predictedCategorie == "" && self.newListItem != "" {
                        self.predictedCategorie = predictProductSize(product: self.newListItem)
                    } else {
                        self.predictedCategorie = ""
                    }
                }) {
                    HStack() {
                        Text("predict size")
                        Image(systemName: self.predictedCategorie == "" ? "arrowtriangle.down.square" : "arrowtriangle.up.square")
                    }
                    
                }
                if self.predictedCategorie != "" && self.newListItem != "" {
                    Text("\(self.predictedCategorie)").animation(.linear)
                }
            }
            
        }.navigationBarTitle(Text("add title"))
        .padding(20)
    }
}


struct addItemView_Previews: PreviewProvider {
    static var previews: some View {
        addItemView()
    }
}

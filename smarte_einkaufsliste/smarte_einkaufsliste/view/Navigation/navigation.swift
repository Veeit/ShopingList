//
//  navigation.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 20.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import SwiftUI
import Foundation

// MARK: navigation
// the custom macOS navigation, it gets his content form listItems.swift
// Default: addView

struct navigation: View {
    @State var selectedMenu: listItems = .add
        
    fileprivate func navigationItem(_ item: listItems) -> some View {
        return Button(action: {self.selectedMenu = item}) {
            HStack() {
                Spacer().frame(width:20)
                Image(systemName: item.image)
                    .imageScale(.large)
                    .foregroundColor(item.imageColor)
                Text(item.title)
                    .layoutPriority(1)
                    .font(.headline)
                Spacer()
            }.frame(height:53)
        }.foregroundColor(Color.primary)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Spacer().frame(height:40)
                    // MARK: Header
                    HStack() {
                        Spacer().frame(width:20)
                        Image("navigationIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .cornerRadius(6)
                        Text("nav title").font(.largeTitle).bold()
                        Spacer()
                    }
                    Spacer().frame(height:20)
                    
                    // MARK: Navigation Item List
                    ForEach(listItems.allCases) { item in
                        if self.selectedMenu == item {
                            self.navigationItem(item)
                                .frame(width: 285)
                                .background(Color.gray.opacity(0.4))
                        } else {
                            self.navigationItem(item)
                        }
                    }.layoutPriority(1)
                }.frame(width: 285)
                 .padding(20)
            }.frame(width: 285)
             .navigationBarTitle(Text("nav title"))
            Divider()
            selectedMenu.contentView
        }.background(Color.gray.opacity(0.2))
        
    }
}

// MARK: iOS Navigaiton
// normal TabView for iOS
// Views are hard coded :/

struct navigationIos: View {
    @State var selectedMenu: listItems = .current
    @State var isActive = true
    
    var body: some View {
        TabView {
            addItemView().tabItem{
                VStack {
                    Image(systemName: "film")
                        .imageScale(.large)
                    Text("nav add to your list")
                }
            }
            currentList().tabItem{
                VStack {
                    Image(systemName: "film")
                        .imageScale(.large)
                    Text("nav your list")
                }
            }
        }
    }
}

#if DEBUG
struct navigation_Previews: PreviewProvider {
    static var previews: some View {
        navigation()
    }
}
#endif

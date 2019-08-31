//
//  ContentView.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 18.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import SwiftUI
import Foundation


// MARK: ContentView:
// Picks the right navigation for your platorm :)

struct ContentView: View {
    #if targetEnvironment(macCatalyst)
    var body: some View {
        navigation()
    }
    #else
    var body: some View {
        navigationIos()
    }
    #endif
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

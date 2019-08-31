//
//  Subview.swift
//  App Onboarding
//
//  Created by Andreas Schultz on 10.08.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct Subview: View {
    
    var imageString: String
    #if targetEnvironment(macCatalyst)
    var body: some View {
        Image(imageString)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .clipped()
    }
    #else
    var body: some View {
           Image(imageString)
           .resizable()
           .aspectRatio(contentMode: .fit)
           .clipped()
           .frame(maxWidth: 500, maxHeight: 377)
       }
    #endif
}

#if DEBUG
struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(imageString: "meditating")
    }
}
#endif

//
//  OnboardingView.swift
//  App Onboarding
//
//  Created by Andreas Schultz on 10.08.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {

    var subviews = [
        UIHostingController(rootView: Subview(imageString: "BannerOnboarding")),
        UIHostingController(rootView: Subview(imageString: "MlBanner")),
        UIHostingController(rootView: Subview(imageString: "swiftUIBanner"))
    ]
    
    var titles = ["INEZ (Intelligent shopping list)", "ML Based shopping List", "SwiftUI for iOS/iPadOS and MacOS"]
    
    var captions =  ["Create a shopping list more quickly and more efficiently with INEZ!", "INEZ is ML based, so you can just fokus on what to realy need to buy, the ML will predicd the best product and autocomplet your sentence.", "This app is based on SwiftUI , this means that you can enjoy this app on all your devices."]
    
    @State var currentPageIndex = 0
    @State var isDone = false
    
    
    var body: some View {
        HStack() {
            if isDone == true {
                ContentView()
            } else {
                VStack(alignment: .leading) {
                    PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
                        .frame(height: 600)
                    Group {
                        Text(titles[currentPageIndex])
                            .font(.title)
                        Text(captions[currentPageIndex])
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(width: 500, height: 80, alignment: .leading)
                        .lineLimit(nil)
                    }
                        .padding()
                    HStack {
                        PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                        Spacer()
                        Button(action: {
                            if self.currentPageIndex+1 == self.subviews.count {
                                self.isDone = true
                                self.currentPageIndex = 0
                            } else {
                                self.currentPageIndex += 1
                            }
                        }) {
                            ButtonContent()
                        }
                    }
                        .padding()
                }
            }
        }
        
    }
}

struct ButtonContent: View {
    var body: some View {
        Image(systemName: "arrowtriangle.right.square")
        .resizable()
        .foregroundColor(.blue)
        .frame(width: 50, height: 50)
        .padding()
    }
}

#if DEBUG
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
#endif

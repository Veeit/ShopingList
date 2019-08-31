//
//  productSizeClassifier.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 31.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import Foundation
import CoreML

// MARK: predictProductSize
// call the predictProductSize ML to predict the product Size
/// product: String    |  the product that shoud be predicted

func predictProductSize(product: String) -> String {
    guard let productSize = try? productSizeClassifier().prediction(text: product) else {
        fatalError("Unexpected runtime error.")
    }
    
    return productSize.label
}


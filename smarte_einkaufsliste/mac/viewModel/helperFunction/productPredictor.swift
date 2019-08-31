//
//  productPredictor.swift
//  smarte_einkaufsliste
//
//  Created by Veit Progl on 28.08.19.
//  Copyright © 2019 Veit Progl. All rights reserved.
//

import Foundation
import CoreML

// MARK: predictRecomentation
// call the predictRecomentation ML to predict the product recomentation
/// product: String    |  the product that shoud be predicted

func predictRecomentation(product: String) -> String {
    guard let prdicted = try? product_predictor().prediction(text: product) else {
        fatalError("Unexpected runtime error.")
    }
    
    return prdicted.label
}


//
//  ReviewRequest.swift
//  Dice On The Go
//
//  Created by Zakary Kurzawski on 7/22/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//
//  Check for how many times user has opened app. If value is 25, 75 or 150, request an app store review.
//  If user has opened app more than 500 times reset the launchCount.
//

import Foundation
import StoreKit

func reviewRequest() {
    let defaults = UserDefaults.standard
    let runCount = defaults.integer(forKey: "launchCount")
    print("run count is \(runCount)")
    switch runCount {
    case 25:
        makeRequest()
    case 75:
        makeRequest()
    case 150:
        makeRequest()
    case 500:
        defaults.set(0, forKey: "launchCount")
    default:
        break;
    }
    
}

func makeRequest() {
    if #available(iOS 10.3, *){
        SKStoreReviewController.requestReview()
    }
}

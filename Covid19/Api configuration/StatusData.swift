//
//  StatusData.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
enum StatusData: String{
    case confirmed = "confirmed"
    case recovered = "recovered"
    case deaths = "deaths"
    
    var titleText:String{
        switch self {
        case .confirmed:
            return "Total cases"
        case .recovered:
            return "Total recovered"
        case .deaths:
            return "Total deaths"
        }
    }
}

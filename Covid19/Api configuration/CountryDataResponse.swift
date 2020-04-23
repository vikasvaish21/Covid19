//
//  CountryDataResponse.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
struct CountryDataResponse:Decodable {
    let cases:Int
    let date : Date
    enum CodingKeys:String,CodingKey {
        
        case cases = "Cases"
        case date = "Date"
    }
}

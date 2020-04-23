//
//  CountryResponse.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
struct CountryResponse:Decodable {
    let name: String
    let slug: String
    let iso2: String
    
    enum CodingKeys:String,CodingKey {
        case name = "Country"
        case slug = "Slug"
        case iso2 = "ISO2"
    }
}

//
//  Country.swift
//  Covid19
//
//  Created by vikas on 21/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation

struct Country: Identifiable {
    var id = UUID()
    let flatImage:String
    let name: String
    let slug: String
}

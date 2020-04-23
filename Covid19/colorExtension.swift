//
//  colorExtension.swift
//  Covid19
//
//  Created by vikas on 20/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI
extension Color{
    init(hex:String){
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }

}

//
//  BackButton.swift
//  Covid19
//
//  Created by vikas on 20/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
import SwiftUI
struct BackButton:View {
    
    var image: String
    var color: Color
    
    init(color:Color,image:String = "back-button") {
        self.color = color
        self.image = image
    }
    var body:some View{
        HStack{
            Image(image)
            .resizable()
                .frame(width:30,height:30,alignment: .center)
            .foregroundColor(color)
        }
    }
}
struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(color: .black)
    }
}

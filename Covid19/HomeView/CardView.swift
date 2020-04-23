//
//  CardView.swift
//  Covid19
//
//  Created by vikas on 20/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var color:String
    var text:String
    var image:String
    
    var body: some View {
        ZStack{
            Color(hex: color)
            HStack{
                VStack{
                    Text(text)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth:0,maxWidth: .infinity,alignment: .leading)
//                        .padding(EdgeInsets(top: 0, leading: 14, bottom: -30, trailing:0))
                        .padding(.leading,15)
                    Image(image)
                        .frame(minWidth:0,maxWidth: .infinity,alignment: .leading)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing:0))
                    }
                VStack{
                    Text("")
                }
            }
        }.frame(width: 150, height: 120, alignment: .center)
        .cornerRadius(15)
            .padding([.leading,.trailing],5)
}
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(color: "88E2AF", text: "Preview", image: "mask")
    }
}

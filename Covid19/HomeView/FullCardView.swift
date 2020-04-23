//
//  FullCardView.swift
//  Covid19
//
//  Created by vikas on 20/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
import SwiftUI
struct FullCardView:View {
    var body: some View{
        ZStack{
            Color(hex: "FF99FF")
            HStack {
                VStack {
                    Text("Stay at home to Fight Coronavirus")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth:0,maxWidth: .infinity,
                               minHeight:50,alignment: .center)
                        .padding(.leading,15)
                        Text("Know More")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth:0,maxWidth: .infinity,alignment: .center)
                        .padding(5)
                        .background(Color(hex:"E574E5"))
                        .cornerRadius(5)
                        .padding()
                }
                VStack{
                    Image("girlmask")
                    .frame(minWidth:0,maxWidth: .infinity,alignment: .bottom)
                        .frame(width: 150, height: 150, alignment: .center)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .cornerRadius(60)
            }
           
        }
    }
        .frame(minWidth:0,maxWidth: .infinity,maxHeight: 150,alignment: .center)
    .cornerRadius(15)
        .padding()
    }
}

struct FullCardView_Previews: PreviewProvider {
    static var previews: some View {
        FullCardView()
    }
}

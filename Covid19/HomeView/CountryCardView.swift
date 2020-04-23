//
//  CountryCardView.swift
//  Covid19
//
//  Created by vikas on 21/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI

struct CountryCardView: View {

    var body: some View {
        ZStack{
            Color(hex: "274281")
            HStack{
                ZStack{
                    HStack{
                        Image("Virus")
                            .resizable()
                            .scaledToFit()
                        .foregroundColor(Color(hex: "CF2B1E"))
                            .frame(minWidth:0,maxWidth: 150,alignment: .leading)
                            .padding(EdgeInsets(top: 60, leading: 0, bottom: 0, trailing: 66))
                            .offset(x:-20,y:0)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                            .frame(minWidth:0,maxWidth: 50,alignment: .leading)
                        VStack{
                           Text("Country Data")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(minWidth:0,maxWidth: .infinity,minHeight: 50,
                                   alignment: .leading)
                            .padding(.leading,15)
                            Text("See all info on cases of infection,deaths,recoveries in each country")
                                .font(Font.system(size:13))
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .frame(minWidth:0,maxWidth: .infinity,minHeight: 50,alignment: .center)
                                .frame(width:280)
                                .padding(.leading,2)
                        }
                        Image("right_arrow")
                        .resizable()
                        .scaledToFit()
                        .frame(width:30,height: 30,alignment: .center)
                            .foregroundColor(.white)
                            .padding(.trailing,30)
                    }
                }
            }
        }.frame(minWidth:0,maxWidth: .infinity,maxHeight: 150,alignment: .center)
            .cornerRadius(15)
            .padding([.leading,.top],15)
            .padding(.trailing,-15)
    }
}

struct CountryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CountryCardView()
    }
}

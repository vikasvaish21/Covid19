//
//  CountryChartView.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI

struct CountryChartView: View {
    @Environment(\.imageCache) var cache :Cache
    var countryName:String
    var flatImage:String
    var body: some View {
        ZStack{
            Color(hex: "388A7B")
            HStack{
                ZStack{
                    HStack{
                        Spacer()
                        Image("shadow")
                            .resizable()
                            .frame(minWidth:0,maxWidth: 120,maxHeight: 150,alignment: .trailing)
                            .offset(x:10,y:20)
                        
                    }
                    HStack{
                        HStack{
                            AsyncImage(urlString: flatImage,placeholder: Text("..."),
                                       cache: self.cache)
                                .frame(minWidth:30,maxWidth: 30,minHeight: 20,maxHeight: 20)
                                .aspectRatio(3 / 2 ,contentMode: .fit)
                                .padding(.leading,40)
                        }
                        Text(countryName)
                            .font(Font.system(size:25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(minWidth:0,maxWidth: .infinity,minHeight:50,alignment: .leading)
                        Spacer()
                            
                    }
                }
            }
        }.frame(minWidth:0,maxWidth: .infinity,maxHeight: 150,alignment: .trailing)
        .cornerRadius(15)
            .padding(.leading,3)
            .padding(.trailing,0)
        
    }
}

struct CountryChartView_Previews: PreviewProvider {
    static var previews: some View {
        CountryChartView(countryName: "Spain", flatImage: "https://raw.githubusercontent.com/hjnilsson/country-flags/master/png1000px/es.png")
    }
}

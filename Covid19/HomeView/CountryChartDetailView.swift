//
//  CountryChartDetailView.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//


import SwiftUICharts
import SwiftUI

struct CountryChartDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.imageCache) var cache: Cache
    @ObservedObject var viewModel: CountryChartDetailViewModel
    private let country: Country

    init(country: Country) {
        self.country = country
        self.viewModel = CountryChartDetailViewModel(country: country)

        UISegmentedControl.appearance().setTitleTextAttributes([
            .foregroundColor: UIColor().from(hexString: "FFC0CB"),
            .font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ], for: .normal)
        UISegmentedControl.appearance().backgroundColor = UIColor().from(hexString: "FFC0CB")
    }
    var body: some View {
        ZStack{
            Color(hex:"FFC0CB").edgesIgnoringSafeArea(.all)
            VStack{
                VStack{
                    HStack{
                        AsyncImage(urlString: viewModel.country.flatImage,placeholder: Text("..."),cache: self.cache)
                            .frame(minWidth:30,maxWidth: 30,minHeight: 20,maxHeight: 20)
                            .aspectRatio(3 / 2,contentMode: .fit)
                        
                        Text(viewModel.country.name)
                            .font(Font.system(size:20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        }.frame(minHeight:0,maxHeight: 40,alignment: .center)
                        
                    Text(viewModel.totalCountTitle)
                        .font(Font.system(size:30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    VStack{
                        Picker(selection: Binding<Int>(
                            get:{
                                self.viewModel.statusSelected
                        },
                            set:{
                                self.viewModel.statusSelected = $0
                        }), label:Text("Select")){
                            ForEach(0..<viewModel.statusData.count){
                                index in Text(self.viewModel.statusData[index].rawValue
                                    .capitalized).tag(index)
                            }
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding([.leading,.trailing,.bottom],10)
                    }.frame(minHeight:0,maxHeight: 30,alignment: .center)
                }
                VStack{
                    VStack{
                        HStack{
                            Text(viewModel.statusData[viewModel.statusSelected]
                                .titleText)
                                .font(Font.system(size:20))
                                .fontWeight(.bold)
                            .foregroundColor(Color(hex: "FFC0CB"))
                                .padding([.leading,.bottom],40)
                                .padding(.top,30)
                            Spacer()
                        }.frame(minHeight:0,maxHeight: 70,alignment: .center)
                            .padding([.top,.bottom],40)
                        LineView(data: viewModel.data.map{
                            Double($0.cases) },title: nil,legend: nil,style: ChartStyle(
                            backgroundColor: .white,
                            accentColor: .green,
                            gradientColor: GradientColor(start: Color(hex: "FFC0CB"), end: Color(hex: "FFC0CB")),
                            textColor: .green,
                            legendTextColor: .green,
                            dropShadowColor: .gray))
                            .padding([.top,.bottom],40)
                            .padding([.leading,.trailing],10)
                        Spacer()
                         }
                    Spacer()
                        .frame(minHeight:0,maxHeight: .infinity,alignment: .center)
                    Button(action:{self.viewModel.openUrlInSafari()
                        
                    }) {
                        Image("covidapi-logo")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(hex: "FFC0CB"))
                            .frame(width:90,height: 30,alignment: .center)
                            .padding(.bottom,40)
                    }
                }.background(Color.white)
                .cornerRadius(20)
                .offset(x:0,y:20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action:{
            self.presentationMode.wrappedValue.dismiss()
        }){
            BackButton(color: Color(.black))
        })
            .navigationBarTitle("",displayMode: .inline)
            .navigationBarColor(UIColor().from(hexString: "FFC0CB"))
    }
}


struct CountryChartDetailView_Previews: PreviewProvider {
    static let viewModel = CountryChartDetailViewModel(data: [CountryDataResponse(cases: 45, date: Date()),
                                                              CountryDataResponse(cases: 1500, date: Date())], country: Country(flatImage: "e", name: "Spain", slug: "spain"))

    static var previews: some View {
        NavigationView {
            CountryChartDetailView(country: Country(flatImage: "https://raw.githubusercontent.com/hjnilsson/country-flags/master/png1000px/es.png", name: "Spain", slug: "spain"))
        }
    }
}

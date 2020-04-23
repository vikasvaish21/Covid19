//
//  CountryListView.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI
struct CountryListView:View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel:CountryListViewModel
    @State var textInput:String = ""
    @State private var showCancelButton:Bool = false
    
    init(viewModel:CountryListViewModel){
        self.viewModel = viewModel
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    
    var body: some View {
           VStack {
               SearchBar(text: $textInput)
               List(viewModel.countries.filter {
                   self.textInput.isEmpty ? true: $0.name.lowercased().contains(self.textInput.lowercased())
               }, id: \.id) { country in
                   CountryListRow(country: country)
               }
           }.navigationBarBackButtonHidden(true)
           .navigationBarItems(leading:
               Button(action: {
                   self.presentationMode.wrappedValue.dismiss()
               }) {
                   BackButton(color: .black)
               })
           .navigationBarTitle("Select a country", displayMode: .inline)
           .navigationBarColor(.white)
       }
}
    
    
struct CountryListRow:View {
        @State var country : Country
        
        var body: some View{
            ZStack{
                CountryChartView(countryName: country.name, flatImage: country.flatImage)
                    .padding(.bottom,10)
                NavigationLink(destination: LazyView{
                    CountryChartDetailView(country: self.country)}){
                        EmptyView()

                }
                
            }
        }
    }
struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CountryListView(viewModel: CountryListViewModel(countries: [Country(flatImage: "", name: "Spain", slug: "spain")]))
        }
    }
}


//
//  Home.swift
//  Covid19
//
//  Created by vikas on 21/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI

 
struct Home: View{
    
    
    @ObservedObject var viewModel = HomeViewModel()
    @State var showRequirementDetail:Bool = false
    @State var showStayHomeDetail:Bool = false
    @State var showCountryView:Bool = false
    @State var requirementSelected:Requirement?
    
    init() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [
            .font:UIFont.systemFont(ofSize: 20,weight: .bold),NSAttributedString.Key.foregroundColor:
                UIColor().from(hexString: "222C44"),
            ]
            appearance.titleTextAttributes = [
            .font:UIFont.systemFont(ofSize:20,weight: .bold),
            NSAttributedString.Key.foregroundColor:
                UIColor().from(hexString:
            "222C44")]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor().from(hexString:"222C44")
        
    }
    
    
    var body: some View{
        ZStack{
            Color(hex: "F4F6FC").edgesIgnoringSafeArea(.all)
            ScrollView(.vertical,showsIndicators: true){
                VStack{
                    NavigationLink(destination:LazyView{
                        CountryListView(viewModel: CountryListViewModel())
                    }){
                        CountryCardView()
                    }
                    Text("Requirements")
                        .font(Font.system(size:20))
                        .fontWeight(.bold)
                        .frame(minWidth:0,maxWidth: .infinity,alignment: .leading)
                        .padding(.leading,15)
                        .padding(.top,30)
                    .foregroundColor(Color(hex: "51525C"))
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(viewModel.required,id: \.self){req in CardView(color: req.color,text: req.text, image: req.image).onTapGesture {
                                self.requirementSelected = req
                                self.showRequirementDetail.toggle()
                                }
                                .sheet(isPresented:self.$showRequirementDetail){
                                    RequirementView(viewModel: RequirementViewModel(requirement: self.requirementSelected!))
                                }
                            }
                        }.padding([.leading,.trailing],10)
                    }.frame(height:120)
                    FullCardView()
                        .onTapGesture {
                        self.showStayHomeDetail.toggle()
                    }
                        .sheet(isPresented:self.$showStayHomeDetail){
                                RequirementView(viewModel: RequirementViewModel(requirement: .stayHome))
                        }
                    }
                }
        }.navigationBarTitle("Covid_19 Data",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
            .navigationBarColor(UIColor().from(hexString: "F4F6FC"))
                }
            }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Home()
        }
    }
}

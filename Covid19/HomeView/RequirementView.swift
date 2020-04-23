//
//  RequirementView.swift
//  Covid19
//
//  Created by vikas on 21/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI

struct RequirementView: View {
    @Environment(\.presentationMode) var presentationalMode
    @ObservedObject var viewModel:RequirementViewModel
    var body:some View{
        ZStack{
            Color(hex: viewModel.requirement.color).edgesIgnoringSafeArea(.all)
            VStack{
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            self.presentationalMode.wrappedValue.dismiss()
                        }){
                            Image("close_icon")
                            .resizable()
                                .frame(width:30,height: 30)
                                .foregroundColor(.white)
                            .padding()
                        }
                    }
            }.frame(minWidth:0,maxWidth: .infinity,minHeight: 0,maxHeight: 60,alignment: .center)
            VStack{
                Image(viewModel.requirement.fullImage)
                    .resizable()
                    .frame(width:200,height: 200,alignment: .center)
                    .scaledToFit()
                
                Text(viewModel.requirement.textTitle)
                    .font(Font.system(size:25))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity,maxHeight: 70,alignment: .center)
                    .padding()
                Text(viewModel.requirement.description)
                    .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
                    .font(Font.system(size: 17))
                .foregroundColor(Color(hex: "F4F6FC"))
                .padding()
                    .background(Color.black.opacity(0.2))
            }.frame(minWidth:0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity,alignment: .center)
            }
        }
    }
}
struct RequirementView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementView(viewModel: RequirementViewModel(requirement:.mask))
    }
}

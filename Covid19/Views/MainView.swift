//
//  MainView.swift
//  Covid19
//
//  Created by vikas on 11/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI

struct MainView:View {
    var body: some View{
            NavigationView{
                ZStack{
                    Color(hex: "CCFFFF").edgesIgnoringSafeArea(.all)
                    VStack{
                        WelcomeImage()
                        TitleAndSubtitleView()
                        WelcomeButton()
                        
                }
            }
           
        }
    }
}

struct WelcomeImage: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.white)
                .scaledToFit()
                .frame(width:340)
                .padding(EdgeInsets(top:-190,leading:60,bottom:10,
                                    trailing:68))
            Image("ThankYou")
                .resizable()
                .scaledToFit()
                .frame(width: 500)
                .frame(minWidth: 0,maxWidth: .infinity)
                .padding(EdgeInsets(top:-190,leading:60,bottom:10,
                                    trailing:60))
            
        }
    }
}

struct TitleAndSubtitleView: View {
    var body: some View {
        VStack{
            Text("Huge Respect For Our Real Heroes")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color(hex: "35DED3"))
                .font(Font.title)
                .multilineTextAlignment(.center)
                .padding([.leading, .bottom, .trailing], 16.0)
                .padding([.top],-80)
            Text("Get All the data and Information")
            .foregroundColor(Color(hex: "66FFFF"))
                .font(Font.subheadline)
        }
    }
}

struct WelcomeButton:View {
    @State var showHomeView:Bool = false
    var body: some View{
        NavigationLink(destination: Home(),isActive: $showHomeView){
            Button(action: {
                self.showHomeView.toggle()
            }){
                Text("Let's Start")
                    .fontWeight(.black)
                    .font(Font.system(size:20))
                    .frame(minWidth:0,maxWidth: .infinity)
                .padding()
                    .background(Color.white)
                .foregroundColor(Color(hex: "35DED3"))
                .cornerRadius(10)
            }.padding(EdgeInsets(top: 100, leading: 40, bottom: 40, trailing: 40))
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



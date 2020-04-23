//
//  AsyncImage.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

struct AsyncImage<Placeholder: View>:View {
    @ObservedObject private var loader: ImageLoader
    private let  placeholder:Placeholder?
    
    
    init(urlString:String,placeholder:Placeholder? = nil,cache: Cache? = nil){
        loader = ImageLoader(url: URL(string: urlString)!,cache: (cache as! ImageCache))
        self.placeholder = placeholder
    }
    
    var body:some View{
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    
    private var image:some View{
        Group{
            if loader.image != nil{
                Image(uiImage: loader.image!)
                .resizable()
            }else{
                placeholder
            }
        }
    }
}

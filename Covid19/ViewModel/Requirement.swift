//
//  Requirement.swift
//  Covid19
//
//  Created by vikas on 21/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
enum Requirement{
    case mask
    case alcohol
    case gloves
    case stayHome
    
    
    var text: String{
        switch self {
        case .mask:
            return "Mask"
        case .alcohol:
            return "Alcohol"
        case .gloves:
            return "Gloves"
        case .stayHome:
            return "Stay at home to Fight Coronavirus"
        
        }
    }
    
    var color: String {
           switch self {
           case .mask: return "388A7B"
           case .alcohol: return "4F62ED"
           case .gloves: return "A9D7E4"
           case .stayHome: return "D3C4FB"
           }
       }
    
    var image:String{
        switch self {
        case .mask:
           return "mask"
        case .alcohol:
          return  "hand-sanitizer"
        case .gloves:
           return "gloves"
        case .stayHome:
            return ""
        }
    }
    
    var textTitle: String {
        switch self {
        case .mask: return "Use masks"
        case .alcohol: return "Wash your hands frequently"
        case .gloves: return "Avoid touching everything and wear gloves"
        case .stayHome: return "Stay at home"
        }
    }
    
    var description: String {
        switch self {
        case .mask: return "Cover your nose and mouth with disposable tissue or handkerchief. \nWhile coughing or sneezing cover your nose and mouth with handkerchief."
        case .alcohol: return "Wash your hands often with soap and water for at least 20 seconds."
        case .gloves: return "Avoid touching your eyes, nose and mouth if your hands aren't clean. \nYou should wear gloves especially when you go out."
        case .stayHome: return "It is very important that individuals with symptoms that may be due to coronavirus (COVID-19) and their household members stay at home. Staying at home will help control the spread of the virus to friends, the wider community, and particularly the most vulnerable.\n\nThose with symptoms and living alone should remain at home for 7 days after the onset of their symptoms. This will reduce the risk of you infecting others."
        }
    }
    
    var fullImage: String {
        switch self {
        case .mask: return "maskgirl"
        case .alcohol: return "wash_full"
        case .gloves: return "distance_full"
        case .stayHome: return "stay-home"
        }
    }
}

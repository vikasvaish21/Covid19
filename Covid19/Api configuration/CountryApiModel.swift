//
//  CountryApiModel.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
import Combine
class CountryApiModel:ApiModel,CountryFetch{
    private enum EndPoint:String{
        case countries = "/countries"
    }
    
    func getCountries() -> AnyPublisher<[CountryResponse],ApiError> {
        
        return call("\(covidApi)\(EndPoint.countries.rawValue)", method: .GET)
    }
}


//
//  CountryStatusData.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
import Combine
class CountryStatusData:ApiModel,CountryDatafetch{
    private enum EndPoint:String{
        case data = "/total/dayone/country/"
    }
    
    func getData(country:String,status: StatusData) -> AnyPublisher<[CountryDataResponse],ApiError> {
        return  call("\(covidApi)\(EndPoint.data.rawValue)\(country)/status/\(status.rawValue)",method: .GET)
    }
}

//
//  CountryDataFetch.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
import Combine
protocol CountryDatafetch {
    func getData(country:String,status:StatusData) ->AnyPublisher<[CountryDataResponse],ApiError>
}

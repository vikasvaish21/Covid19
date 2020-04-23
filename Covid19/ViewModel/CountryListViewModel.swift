//
//  CountryListViewModel.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI
import Combine

final class CountryListViewModel:ObservableObject{
    @Published var countries:[Country] = []
    var provider: CountryFetch!
    private var publishers = [AnyCancellable]()
    
    deinit {
        publishers.forEach{ $0.cancel()}
    }
    
    init() {
        provider = CountryApiModel()
        getCountries()
    }
    init(countries:[Country]) {
        self.countries = countries
       getCountries()
    }
    
    
    func getCountries(){
        provider
        .getCountries()
        .replaceError(with: [])
            .map{$0.map{Country(flatImage: "https://raw.githubusercontent.com/hjnilsson/country-flags/master/png1000px/\($0.iso2.lowercased()).png", name: $0.name, slug: $0.slug)}
            .sorted(by: {$0.name < $1.name}) }
            .receive(on: RunLoop.main)
        .sink(receiveCompletion: {error in
            
        }){ value in
            self.countries = value
        }
    .store(in: &publishers)
    }
}

//
//  CountryChartDetailViewModel.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI
import Combine
final class CountryChartDetailViewModel:ObservableObject{
    @Published var data: [CountryDataResponse] = []
    var statusSelected = 0{
        didSet{
            getData()
        }
    }
    @Published var totalCountTitle:String = ""
    var country : Country!
    var provider: CountryDatafetch!
    private var publisher = [AnyCancellable]()
    var statusData:[StatusData] = [.confirmed,.recovered,.deaths]
    
    deinit {
        publisher.forEach{$0.cancel()}
    }
    
    init(country:Country){
        self.country = country
        provider = CountryStatusData()
        getData()
    }
    
    init(data: [CountryDataResponse],country:Country) {
        self.data = data
        self.country = country
    }
    
    func getData(){
        provider.getData(country: country.slug, status: statusData[statusSelected])
        .replaceError(with: [])
            .map{$0.filter{$0.cases > 0}}
            .receive(on: RunLoop.main)
            .sink(receiveCompletion:{ value in }){
                value in
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let formattedNumber = numberFormatter.string(from: NSNumber(value: value.last?.cases ?? 0))
                self.totalCountTitle = formattedNumber ?? ""
                self.data = value
        }
    .store(in: &publisher)
    }
    
    func openUrlInSafari(){
        UIApplication.shared.open(URL(string: "https://covid19api.com/")!,options: [:],completionHandler: nil)
    }
}


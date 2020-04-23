//
//  ApiModel.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//
import Combine
import Foundation
class ApiModel{
    let covidApi = "https://api.covid19api.com/"
    enum Method:String{
        case GET
    }
    func call<T:Decodable>(_ endpoint:String,method:Method)-> AnyPublisher<T,ApiError>{
        let urlRequest = request(for:endpoint,method:method)
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .iso8601
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError{ _ in ApiError.serverError}
            .map{$0.data}
            .decode(type: T.self, decoder: decoder)
            .mapError{ _ in ApiError.parsingError}
        .eraseToAnyPublisher()
        
    }
    func request(for endpoint:String,method:Method) -> URLRequest{
        guard let url = URL(string: endpoint.folding(options: .diacriticInsensitive, locale: .current))
            else{ preconditionFailure("Bad URL \(endpoint)")}
        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"
        request.allHTTPHeaderFields = ["Content-Type":"application/json"]
        print("🌍🌍🌍🌍🌍🌍🌍🌍🌍")
        print("REQUEST: [\(method.rawValue)] \(endpoint)")
        return request
        
    }
}

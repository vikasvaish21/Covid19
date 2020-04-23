//
//  ImageLoader.swift
//  Covid19
//
//  Created by vikas on 21/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader : ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private var cancellable :AnyCancellable?
    private var cache: ImageCache?
    
    init(url:URL,cache:ImageCache? = nil) {
        self.url = url
        self.cache = cache
    }
    deinit{
        cancellable?.cancel()
    }
    
    func load(){
        if let image = cache?[url]{
            self.image = image
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map{UIImage(data: $0.data) }
        .replaceError(with: nil)
            .handleEvents(receiveOutput:{ [weak self] in self?.cache($0)})
            .receive(on: DispatchQueue.main)
            .assign(to: \.image,on:self)
    }
            
    private func cache(_ image:UIImage?){
        image.map{ cache?[url] = $0}
    }

        func cancel(){
            cancellable?.cancel()
        }
}
    


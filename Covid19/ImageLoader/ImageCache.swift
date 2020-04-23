//
//  ImageCache.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
import UIKit


protocol Cache {
    subscript(_ url: URL) -> UIImage? {get set}
}


struct ImageCache : Cache {
    private let cache = NSCache<NSURL,UIImage>()
    subscript(_ key : URL) -> UIImage?{
    get { cache.object(forKey: key as NSURL) }
        set { newValue == nil ? cache.removeObject(forKey: key as NSURL): cache.setObject(newValue!, forKey: key as NSURL)
    }
}
}

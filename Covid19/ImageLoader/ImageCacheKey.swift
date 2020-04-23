//
//  ImageCacheKey.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageCacheKey:EnvironmentKey {
    static let defaultValue: Cache = ImageCache()
}
extension EnvironmentValues{
    var imageCache: Cache{
        get{ self[ImageCacheKey.self]}
        set{ self[ImageCacheKey.self] = newValue}
    }
}

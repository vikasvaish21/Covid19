//
//  ApiError.swift
//  Covid19
//
//  Created by vikas on 22/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import Foundation
public enum ApiError:Error{
    case internalError
    case serverError
    case parsingError
}

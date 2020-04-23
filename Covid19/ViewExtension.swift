//
//  ViewExtension.swift
//  Covid19
//
//  Created by vikas on 20/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//
import Foundation
import SwiftUI
import UIKit

extension View{
    func navigationBarColor(_ backgroundColor:UIColor?) -> some
        View{
            self.modifier(NavigationBarModifier(backgroundColor:
                backgroundColor))
        }
    }

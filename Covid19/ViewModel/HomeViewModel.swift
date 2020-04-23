//
//  HomeViewModel.swift
//  Covid19
//
//  Created by vikas on 21/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//
import SwiftUI
import Combine

final class HomeViewModel:ObservableObject{
    @Published var required: [Requirement] = []
    deinit {

    }
    
    init() {
        required = [.mask,.alcohol,.gloves]
    }
}

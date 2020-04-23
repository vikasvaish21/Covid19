//
//  RequirementViewModel.swift
//  Covid19
//
//  Created by vikas on 21/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI
import Combine

final class RequirementViewModel: ObservableObject{
    var requirement : Requirement!
    deinit {

    }
    init(requirement: Requirement) {
        self.requirement = requirement
    }
}

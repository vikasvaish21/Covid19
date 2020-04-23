//
//  LazyView.swift
//  Covid19
//
//  Created by vikas on 20/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI
struct LazyView<Content:View>:View {
    var content: () -> Content
    var body: some View{
        self.content()
    }
}

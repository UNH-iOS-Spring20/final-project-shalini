//
//  SelectedItems.swift
//  MyOwnPeriod
//
//  Created by Shalu Garikapaty on 5/5/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI
import UIKit


class SelectedItems: ObservableObject {
    @Published var items = [CatogoryItem]()
    
    func add(item: CatogoryItem) {
        items.append(item)
    }

    func remove(item: CatogoryItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
}


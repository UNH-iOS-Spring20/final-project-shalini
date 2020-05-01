//
//  MultipleSelectionRow.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 4/30/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

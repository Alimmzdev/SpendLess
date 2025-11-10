//
//  ViewExtenstions.swift
//  SpendLess
//
//  Created by Alimmz on 11/10/25.
//

import SwiftUI

extension View {
    @ViewBuilder
    func ifCondition(_ condition: Bool, transform: (Self) -> some View) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

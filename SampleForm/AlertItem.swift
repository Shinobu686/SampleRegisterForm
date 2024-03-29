//
//  AlertItem.swift
//  SampleForm
//
//  Created by 久富稜也 on 2021/02/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text?
    var dismissButton: Alert.Button?
}

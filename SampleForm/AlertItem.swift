//
//  AlertItem.swift
//  SampleForm
//
//  Created by 久富稜也 on 2021/02/23.
//

import SwiftUI

enum AlertType: Identifiable {
    case select(title: String,
                message: String?,
                primaryButton: Alert.Button,
                secondaryButton: Alert.Button)
    
    case complete(title: String,
                  message: String?,
                  dismissButton: Alert.Button)
    
    case failure(title: String,
                 message: String?,
                 dismissButton: Alert.Button)
    
    var id: String {
        switch self {
        case .select:
            return "登録確認"
            
        case .complete:
            return "完了"
            
        case .failure:
            return "エラー"
        }
    }
    
    var alert: Alert {
        switch self {
        case .select(title: let title, message: let message, primaryButton: let primaryButton, secondaryButton: let secondaryButton):
            return Alert(title: Text(title), message: message != nil ? Text(message!) : nil, primaryButton: primaryButton, secondaryButton: secondaryButton)
            
        case .complete(title: let title, message: let message, dismissButton: let dismissButton):
            return Alert(title: Text(title), message: message != nil ? Text(message!) : nil, dismissButton: dismissButton)
            
        case .failure(title: let title, message: let message, dismissButton: let dismissButton):
            return Alert(title: Text(title), message: message != nil ? Text(message!) : nil, dismissButton: dismissButton)
        }
    }
    
}

//
//  User.swift
//  SampleForm
//
//  Created by 久富稜也 on 2021/02/21.
//

import Foundation
import RealmSwift
import SwiftUI

class User: Object {
    @objc dynamic var name = ""
    @objc dynamic var password = ""
    
    static var realm = try! Realm()
    
    // ユーザー登録メソッド
    static func create(name: String, password: String) -> Bool {
        do {
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            let user = User()
            user.name = name
            user.password = password
            try realm.write {
                realm.add(User(value: ["name": name, "password": password]))
            }
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    // アラート判定メソッド
    static func createJudge(name: String, password: String) -> AlertItem {
        if User.create(name: name, password: password) {
            return AlertItem(title: Text("完了"),
                             message: Text("登録しました"),
                             dismissButton: .cancel(Text("OK")))
        } else {
            return AlertItem(title: Text("エラー"),
                             message: Text("登録できませんでした"),
                             dismissButton: .cancel(Text("OK")))
        }
    }
    
}

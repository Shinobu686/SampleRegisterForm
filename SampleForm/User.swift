//
//  User.swift
//  SampleForm
//
//  Created by 久富稜也 on 2021/02/21.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name = ""
    @objc dynamic var password = ""
        
    static var realm = try! Realm()
    
    static func create(name: String, password: String) throws {
        let user = User()
        user.name = name
        user.password = password
        try realm.write {
            realm.add(User(value: ["name": name, "password": password]))
        }
    }
    
}

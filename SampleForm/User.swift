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
}

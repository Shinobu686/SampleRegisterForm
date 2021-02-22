//
//  UserRegisterView.swift
//  SampleForm
//
//  Created by 久富稜也 on 2021/02/18.
//

import SwiftUI
import RealmSwift

struct UserRegisterView: View {
    
    @State var name = ""
    @State var password = ""
    
    var screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(spacing: 50) {
            VStack {
                TextField("ユーザー名を入力", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: screenWidth / 1.5)
                
                SecureField("パスワードを入力", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: screenWidth / 1.5)
            }
            
            Button(action: {
                let realm = try! Realm()
                try! realm.write {
                    realm.add(User(value: ["name": name, "password": password]))
                }
                
            }) {
                Text("登録")
                    .fontWeight(.bold)
                    .frame(width: screenWidth / 1.5, height: screenWidth / 7)
                    .font(.title2)
                    .background(name.isEmpty || password.isEmpty ? Color.gray : Color(#colorLiteral(red: 0.2610365748, green: 0.6647360325, blue: 0.5856692791, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }.disabled(name.isEmpty || password.isEmpty)
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center)
        .background(Color(#colorLiteral(red: 0.4960951805, green: 0.7146345377, blue: 0.9368119836, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct UserRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegisterView()
    }
}

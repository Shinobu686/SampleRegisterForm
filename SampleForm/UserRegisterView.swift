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
    @State var alertType: AlertType?
    
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
                self.alertType = AlertType.select(
                    title: "確認メッセージ",
                    message: "登録してもよろしいですか？",
                    primaryButton: .default(Text("OK")) {
                        
                        do {
                            try User.create(name: name, password: password)
                        } catch {
                            self.alertType = AlertType.failure(title: "エラーメッセージ",
                                                               message: "登録に失敗しました",
                                                               dismissButton: .cancel(Text("OK")))
                        }
                        
                        self.alertType = AlertType.complete(
                            title: "確認メッセージ",
                            message: "登録が完了しました",
                            dismissButton: .cancel(Text("OK")) {
                                self.name = ""
                                self.password = ""
                            }
                        )
                    },
                    secondaryButton: .cancel()
                )
            }) {
                Text("登録")
                    .fontWeight(.bold)
                    .frame(width: screenWidth / 1.5, height: screenWidth / 7)
                    .font(.title2)
                    .background(name.isEmpty || password.isEmpty ? Color.gray : Color(#colorLiteral(red: 0.2610365748, green: 0.6647360325, blue: 0.5856692791, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }.disabled(name.isEmpty || password.isEmpty)
        }
        .alert(item: $alertType) { alertType in
            alertType.alert
        }
        .frame(minWidth: 0,
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

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
    @State var showingAlert = false
    @State var alertItem: AlertItem?
    
    var screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            VStack(spacing: 50) {
                VStack {
                    TextField("ユーザー名を入力", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: screenWidth / 1.5)
                    
                    SecureField("パスワードを入力", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: screenWidth / 1.5)
                }
                VStack {
                    Button(action: {
                        showingAlert = true
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
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("確認メッセージ"),
                          message: Text("登録してもよろしいですか？"),
                          primaryButton: .default(Text("OK")) {
                            
                            self.alertItem = User.createJudge(name: name, password: password)
                          }, secondaryButton: .cancel())
                }
            }
            Text("")
                .alert(item: $alertItem) { alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: alertItem.dismissButton)
                }
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

//
//  SignInView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/02/03.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // image
                Spacer()
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .textInputAutocapitalization(.never)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                Button {
                    print("Log user in ...")
                } label: {
                    HStack {
                        Text("サインイン")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                // sign up button
                NavigationLink {
                    
                } label: {
                    HStack(spacing: 3) {
                        Text("パスワードをお忘れですか？")
                        Text("会員登録")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    SignInView()
}

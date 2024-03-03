//
//  SignUpView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/03/03.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                    
                    InputView(text: $fullName,
                              title: "Full Name",
                              placeholder: "Enter your password")
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password")
                    .textInputAutocapitalization(.never)
                    
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    .textInputAutocapitalization(.never)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                Button {
                    Task {
                        try await viewModel.singUp(withEmail: email, password: password, fullName: fullName)
                    }
                    print("Sign user up ...")
                } label: {
                    HStack {
                        Text("会員登録")
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
            }
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("既にアカウントをお持ちですか？")
                    Text("ログイン")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
}

#Preview {
    SignUpView()
}

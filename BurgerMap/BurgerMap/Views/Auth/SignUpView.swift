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
                              title: R.string.localizable.emailAddress(),
                              placeholder: R.string.localizable.emailPlaceHolder())
                    .textInputAutocapitalization(.never)
                    
                    InputView(text: $fullName,
                              title: R.string.localizable.nickname(),
                              placeholder: R.string.localizable.enterNickname())
                    
                    InputView(text: $password,
                              title: R.string.localizable.password(),
                              placeholder: R.string.localizable.enterPassword(),
                              isSecureField: true)
                    .textInputAutocapitalization(.never)
                    
                    ZStack(alignment: .trailing) {
                        InputView(text: $confirmPassword,
                                  title: R.string.localizable.confirmPassword(),
                                  placeholder: R.string.localizable.enterConfirmPassword(),
                                  isSecureField: true)
                        .textInputAutocapitalization(.never)
                        
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color(.systemGreen))
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color(.systemRed))
                            }
                        }
                    }
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
                        Text(R.string.localizable.signUp())
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
            }
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text(R.string.localizable.alreadyHaveAccount())
                    Text(R.string.localizable.signIn())
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
}

// MARK - AuthenticationFormProtocol
extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && password == confirmPassword
        && !fullName.isEmpty
    }
}

#Preview {
    SignUpView()
}

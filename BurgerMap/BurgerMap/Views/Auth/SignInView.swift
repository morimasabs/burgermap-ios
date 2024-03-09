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
                    
                    InputView(text: $password,
                              title: R.string.localizable.password(),
                              placeholder: R.string.localizable.enterPassword(),
                              isSecureField: true)
                    .textInputAutocapitalization(.never)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text(R.string.localizable.signIn())
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
                // sign up button
                NavigationLink {
                    SignUpView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text(R.string.localizable.forgotPassword())
                        Text(R.string.localizable.signUp())
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

// MARK - AuthenticationFormProtocol
extension SignInView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    SignInView()
}

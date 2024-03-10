//
//  ProfileView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/03/03.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var isShowAlert = false
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.abbreviation)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .tint(.gray)
                        }
                    }
                }
                
                Section(R.string.localizable.general()) {
                    HStack {
                        SettingRowView(imageName: "gear", title: R.string.localizable.version(), tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                
                Section(R.string.localizable.account()) {
                    Button {
                        viewModel.singOut()
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill", title: R.string.localizable.signOut(), tintColor: .red)
                    }
                    
                    Button {
                        Task {
                            isShowAlert.toggle()
                        }
                    } label: {
                        SettingRowView(imageName: "xmark.circle.fill", title: R.string.localizable.deleteAccount(), tintColor: .red)
                    }
                    .alert(R.string.localizable.deleteAccountConfirmation(), isPresented: $isShowAlert) {
                        Button(R.string.localizable.cancel(), role: .cancel) {}
                        Button(R.string.localizable.deleteAccount(), role: .destructive) {
                            Task {
                                await viewModel.deleteAccount()
                            }
                        }
                    }
                }
            }
        } else {
            FailureView {
                Task {
                    await viewModel.fetchUser()
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}

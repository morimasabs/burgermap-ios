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
                
                Section("General") {
                    HStack {
                        SettingRowView(imageName: "gear", title: "バージョン", tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                
                Section("Account") {
                    Button {
                        viewModel.singOut()
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill", title: "ログアウト", tintColor: .red)
                    }
                    
                    Button {
                        Task {
                            isShowAlert.toggle()
                        }
                    } label: {
                        SettingRowView(imageName: "xmark.circle.fill", title: "退会する", tintColor: .red)
                    }
                    .alert("退会しますか？", isPresented: $isShowAlert) {
                        Button("キャンセル", role: .cancel) {}
                        Button("退会する", role: .destructive) {
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

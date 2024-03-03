//
//  AuthViewModel.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/03/03.
//

import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        
    }
    
    func signIn(withEmail email: String , password: String) async throws {
        print("Sing in..")
    }
    
    func singUp(withEmail email: String, password: String, fullName: String) async throws {
        print("Create ")
    }
    
    func singOut() {
        
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() {
        
    }
}

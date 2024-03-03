//
//  User+mock.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/03/03.
//

import Foundation

extension User {
    static let mock1 = User(id: UUID().uuidString, fullName: "ハンバーガー 太郎", email: "mock1@gmail.com")
    static let mock2 = User(id: UUID().uuidString, fullName: "次郎 ハンバーガー", email: "mock2@gmail.com")
}

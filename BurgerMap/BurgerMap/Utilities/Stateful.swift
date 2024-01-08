//
//  Stateful.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

enum Stateful {
    case loading
    case failed(Error)
    case loaded
}

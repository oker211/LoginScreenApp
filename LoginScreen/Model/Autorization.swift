//
//  Autorization.swift
//  LoginScreen
//
//  Created by Филипп Слабодецкий on 10.02.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(login: "admin", password: "admin",
             person: Person(name: "Filipp", surname: "Moris"))
    }
}

struct Person {
    let name: String
    let surname: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
}

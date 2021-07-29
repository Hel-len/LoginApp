//
//  User.swift
//  LoginApp
//
//  Created by Елена Дранкина on 29.07.2021.
//
 

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "user",
            password: "password",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "John", surname: "Snow", image: "johnSnow")
    }
}

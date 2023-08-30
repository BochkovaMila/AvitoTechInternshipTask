//
//  AvitoError.swift
//  AvitoTechInternshipTask
//
//  Created by Mila B on 28.08.2023.
//

import UIKit

enum AvitoError: String, Error {
    
    case invalidURL = "Этот URL-адрес создал недопустимый запрос. Пожалуйста, попробуйте снова."
    case unableToComplete = "Не удалось выполнить ваш запрос. Пожалуйста, проверьте свое подключение к Интернету."
    case invalidResponse = "Неверный ответ от сервера. Пожалуйста, попробуйте снова."
    case invalidData = "Данные, полученные с сервера, были недействительными. Пожалуйста, попробуйте снова."    
}


enum Labels {
    
    static let errorLabel = "Произошла ошибка"
    static let characteristics = "Характеристики"
    static let noEmail = "Электронная почта недоступна"
    static let noPhoneNumber = "Номер телефона недоступен"
    static let description = "Описание"
    static let noDescription = "Описание недоступно"
}


enum Images {
    
    static let avatarPlaceholder = UIImage(systemName: "questionmark.circle")
    static let doneButton = UIImage(systemName: "arrow.left")
}

//
//  Generator.swift
//  RightOnTarget
//
//  Created by Екатерина Алексеева on 03.10.2022.
//

import Foundation

//MARK: - GeneratorProtocol

protocol GeneratorProtocol {
    //MARK: -  Методы
    
    func getRandomValue() -> Int
}

//MARK: - Generator class

class Generator: GeneratorProtocol {
    
    //MARK: - Свойства
    private var minSecretValue: Int
    private var maxSecretValue: Int
    
    //MARK: - Инициализатор
    
    init?(startValue: Int, endValue: Int) {
        // Стартовое значение для выбора случайного числа не может быть больше конечного
        guard startValue <= endValue else { return nil }
        minSecretValue = startValue
        maxSecretValue = endValue
    }
    
    //MARK: -  Методы
    
    func getRandomValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
}

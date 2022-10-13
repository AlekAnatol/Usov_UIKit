//
//  Generator.swift
//  RightOnTarget
//
//  Created by Екатерина Алексеева on 03.10.2022.
//

import Foundation
import UIKit

//MARK: - GeneratorProtocol

protocol GeneratorProtocol {
    //MARK: -  Методы
    
    func getRandomValue() -> Int
}

//MARK: - Generator class
// Генератор случайных чисел
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


//MARK: - Generator class
// Генератор случайного цвета
class ColorGenerator: GeneratorProtocol {
    
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
    
    internal func getRandomValue() -> Int {
        return Int.random(in: 0...255)
    }
    
    func getRandomColor() -> UIColor {
        return UIColor(red: CGFloat(getRandomValue()),
                       green: CGFloat(getRandomValue()),
                       blue: CGFloat(getRandomValue()),
                       alpha: 1)
    }
}

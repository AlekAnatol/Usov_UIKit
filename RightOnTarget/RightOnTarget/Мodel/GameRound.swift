//
//  GameRound.swift
//  RightOnTarget
//
//  Created by Екатерина Алексеева on 03.10.2022.
//

import Foundation

//MARK: - GameRoundProtocol

protocol GameRoundProtocol {
    
    //MARK: - Свойства
    var score: Int { get }
    var currentSecretValue: Int { get }
    
    //MARK: -  Методы
    
    func calculateScore(with: Int)
}

//MARK: - class GameRound

class GameRound: GameRoundProtocol {
    
    //MARK: - Свойства
    
    var score: Int = 0
    var currentSecretValue: Int = 0
    
    //MARK: - Инициализатор
    
    init(secretValue: Int) {
        currentSecretValue = secretValue
    }
    
    //MARK: -  Методы
    
    func calculateScore(with value: Int) {
        score += 100 - abs(currentSecretValue - value) * 2
    }
}

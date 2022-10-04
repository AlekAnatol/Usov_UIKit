//
//  Game.swift
//  RightOnTarget
//
//  Created by Екатерина Алексеева on 03.10.2022.
//

import Foundation

//MARK: - GameProtocol

protocol GameProtocol {
    //MARK: - Свойства
    
    var score: Int { get }
    var currentRound: GameRound! { get }
    var secretValueGenerator: Generator { get }
    var isGameEnded: Bool { get }
    //MARK: -  Методы
    
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // Начинает новый раунд (обновляет загаданное число)
    func startNewRound()
}

//MARK: - class Game

class Game: GameProtocol {
    //MARK: - Свойства
    
    // Количество очков
    var score: Int {
        var scoreCalculate = 0
        for round in roundsArray {
            scoreCalculate += round.score
        }
        return scoreCalculate
    }
    // Количество раундов
    private var lastRound: Int
    // Данные текущего раунда
    var currentRound: GameRound!
    // Данные всех раундов текущей игры
    private var roundsArray: [GameRound] = []
    // Генератор случайных чисел
    var secretValueGenerator: Generator
    // Проверяет, окончена ли игра
    var isGameEnded: Bool {
        if roundsArray.count == lastRound {
            return true
        } else {
            return false
        }
    }
    
    //MARK: -  Инициализатор
    
    init(generator: Generator, rounds: Int) {
        secretValueGenerator = generator
        lastRound = rounds
        currentRound = GameRound(secretValue: secretValueGenerator.getRandomValue())
        roundsArray.append(currentRound)
    }
    
    //MARK: -  Методы
    
    // Начинаем новую игру
    func restartGame() {
        roundsArray = []
        startNewRound()
    }
    // Начинаем новый раунд
    func startNewRound() {
        currentRound = GameRound(secretValue: secretValueGenerator.getRandomValue())
        roundsArray.append(currentRound)
    }
}

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
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    //MARK: -  Методы
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // Начинает новый раунд (обновляет загаданное число)
    func startNewRound()
    // Сравнивает переданное значение с загаданным и начисляет очки
    func calculateScore(with: Int)
}

//MARK: - class Game
class Game: GameProtocol {
    //MARK: - Свойства
    var score: Int = 0
    // Минимальное загаданное значение
    private var minSecretValue: Int
    // Максимальное загаданное значение
    private var maxSecretValue: Int
    var currentSecretValue: Int = 0
    // Количество раундов
    private var lastRound: Int
    private var currentRound: Int = 1
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    //MARK: -  Инициализатор
    init?(startValue: Int, endValue: Int, rounds: Int) {
        // Стартовое значение для выбора случайного числа не может быть больше конечного
        guard startValue <= endValue else { return nil }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    //MARK: -  Методы
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    // Загадать и вернуть новое случайное значение
    private func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    // Подсчитывает количество очков
    func calculateScore(with value: Int) {
        score += 100 - abs(currentSecretValue - value) * 2
    }
}

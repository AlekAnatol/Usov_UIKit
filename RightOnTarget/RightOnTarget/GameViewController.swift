//
//  GameViewController.swift
//  RightOnTarget
//
//  Created by Екатерина Алексеева on 29.09.2022.
//

import UIKit

class GameViewController: UIViewController {
    //MARK: - Свойства
    var gameSession: Game!
    
    //Создание UI-элементов
    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.value = 25
        slider.minimumValueImage = UIImage(systemName: "01.square.fill")
        slider.maximumValueImage = UIImage(systemName: "50.square.fill")
        slider.minimumTrackTintColor = UIColor.black
        slider.maximumTrackTintColor = UIColor.yellow
        slider.thumbTintColor = UIColor.blue
        return slider
    }()
    
    let checkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.yellow
        button.setTitle(" Check number ", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.yellow, for: .highlighted)
        return button
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textAlignment = .center
        label.text = "0"
        return label
    }()
    
    //MARK: - ViewController live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(checkButton)
        view.addSubview(slider)
        view.addSubview(numberLabel)
        let generator = Generator(startValue: 1, endValue: 50)!
        gameSession = Game(generator: generator, rounds: 3)
        updateLabelWithSecretNumber(newText: String(gameSession.currentRound.currentSecretValue))
        setUI()
        checkButton.addTarget(self, action: #selector(checkButtonPressed), for: .touchUpInside)
    }
    
    //MARK: - Методы
    //Настрой расположения UI-элементов на экране
    func setUI() {
        view.backgroundColor = UIColor.orange
        
        slider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        slider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        
        checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 30).isActive = true
        
        numberLabel.leftAnchor.constraint(equalTo: checkButton.leftAnchor).isActive = true
        numberLabel.rightAnchor.constraint(equalTo: checkButton.rightAnchor).isActive = true
        numberLabel.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 30).isActive = true
    }
    
    //Обработка нажатия кнопки checkButton
    @objc func checkButtonPressed(target: UIButton) {
        if target == self.checkButton {
            // Высчитываем очки за раунд
            gameSession.currentRound.calculateScore(with: Int(slider.value))
            // Проверяем, окончена ли игра
            if gameSession.isGameEnded {
                //Выводим всплывающее окно с количеством заработанных очков
                showAlertWith(score: gameSession.score)
                // Начинаем игру заново
                gameSession.restartGame()
                }  else  {
                    //Запускаем новый раунд
                    gameSession.startNewRound()
            }
            // Обновляем данные о текущем значении загаданного числа
            updateLabelWithSecretNumber(newText: String(gameSession.currentRound.currentSecretValue))
        }
    }
    
    // Обновление текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String ) {
     numberLabel.text = newText
    }
    
    // Отображение всплывающего окна со счетом
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена",
                                      message: "Вы заработали \(score) очков",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

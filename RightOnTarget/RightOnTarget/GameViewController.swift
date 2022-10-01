//
//  GameViewController.swift
//  RightOnTarget
//
//  Created by Екатерина Алексеева on 29.09.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    // загаданное число
    var number: Int = 0
    // раунд
    var round: Int = 0
    // сумма очков за раунд
    var points: Int = 0
    
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
        button.setTitle("  Start game  ", for: .normal)
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
    
    //ViewController live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(checkButton)
        view.addSubview(slider)
        view.addSubview(numberLabel)
        checkButton.addTarget(self, action: #selector(checkButtonPressed), for: .touchUpInside)
        setUI()
    }
    
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
    
    //Обработка нажатия кнопки
    @objc func checkButtonPressed(target: UIButton) {
        if target == self.checkButton {
            if round == 0 {
                number = Int.random(in: 1...50)
                numberLabel.text = String(number)
                checkButton.setTitle("Check Number", for: .normal)
                round = 1
                print("Start game, number = \(number)")
            } else if round < 5 {
                let userNumber = Int(slider.value.rounded())
                points += 100 - abs(number - userNumber) * 2
                round += 1
                print("points ", points, "round ", round)
            } else if round == 5 {
                let userNumber = Int(slider.value.rounded())
                points += 100 - abs(number - userNumber) * 2
                slider.value = 25
                let alert = UIAlertController(title: "Game over",
                                              message: "Count of points: \(points)",
                                              preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                round = 0
                points = 0
                checkButton.setTitle("Start game", for: .normal)
                print("game over")
            }
        }
    }
}

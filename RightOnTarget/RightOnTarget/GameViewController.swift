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
    var round: Int = 1
    // сумма очков за раунд
    var points: Int = 0
    lazy var secondViewController = SecondViewController()
    
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
        button.setTitle("  Check Number  ", for: .normal)
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
    
    let aboutAppButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.yellow
        button.setTitle("  about app  ", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.yellow, for: .highlighted)
        return button
    }()
    
    //ViewController live cycle
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        view.addSubview(checkButton)
        view.addSubview(slider)
        view.addSubview(numberLabel)
        view.addSubview(aboutAppButton)
        number = Int.random(in: 1...50)
        numberLabel.text = String(number)
        checkButton.addTarget(self, action: #selector(checkButtonPressed), for: .touchUpInside)
        aboutAppButton.addTarget(self, action: #selector(aboutAppBattunPressed), for: .touchUpInside)
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    //Настройка расположения UI-элементов на экране
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
        
        aboutAppButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        aboutAppButton.leftAnchor.constraint(equalTo: view.rightAnchor, constant: -120).isActive = true
        aboutAppButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        aboutAppButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    //Обработка нажатия кнопки checkButton
    @objc func checkButtonPressed(target: UIButton) {
        if target == self.checkButton {
            if round < 5 {
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
                round = 1
                points = 0
                number = Int.random(in: 1...50)
                numberLabel.text = String(number)
                print("game over, points \(points)")
            }
        }
    }
    
    //Обработка нажатия кнопки aboutAppBattun
    @objc func aboutAppBattunPressed(target: UIButton) {
        if target == self.aboutAppButton {
            //let viewController = SecondViewController()
            //let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
            //self.show(viewController, sender: self)
            //self.present(secondViewController, animated: true, completion: nil)
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
}

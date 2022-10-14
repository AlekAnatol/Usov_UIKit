//
//  ChooseGameViewController.swift
//  RightOnTarget
//
//  Created by Екатерина Алексеева on 04.10.2022.
//

import UIKit

class ChooseGameViewController: UIViewController {
    
    //MARK: - Свойства
    var chooseGameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 20))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Выберите вариант игры"
        return label
    }()
    
    var colorsButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 8
        button.setTitle("Угадать цвет", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.yellow, for: .highlighted)
        return button
    }()
    
    var numbersButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 8
        button.setTitle("Угадать число", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.yellow, for: .highlighted)
        return button
    }()
    //MARK: - ViewController live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(chooseGameLabel)
        view.addSubview(colorsButton)
        view.addSubview(numbersButton)
        setUI()
        colorsButton.addTarget(self, action: #selector(colorsButtonPressed), for: .touchUpInside)
        numbersButton.addTarget(self, action: #selector(numbersButtonPressed), for: .touchUpInside)
    }
    
    //MARK: - Методы
    //Настрой расположения UI-элементов на экране
    func setUI() {
        view.backgroundColor = UIColor.cyan
        
        chooseGameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chooseGameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        colorsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        colorsButton.rightAnchor.constraint(equalTo: chooseGameLabel.leftAnchor, constant: -20).isActive = true
        colorsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 150).isActive = true
        
        numbersButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        numbersButton.leftAnchor.constraint(equalTo: chooseGameLabel.rightAnchor, constant: 20).isActive = true
        numbersButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150).isActive = true
    }
    
    @objc func numbersButtonPressed(target: UIButton) {
        guard target.titleLabel?.text == numbersButton.titleLabel?.text else { return }
        let nextVC = NumbersViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func colorsButtonPressed(target: UIButton) {
        guard target.titleLabel?.text == colorsButton.titleLabel?.text else { return }
        let nextVC = ColorsViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


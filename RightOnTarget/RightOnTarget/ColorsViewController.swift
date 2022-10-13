//
//  ColorsViewController.swift
//  RightOnTarget
//
//  Created by Екатерина Алексеева on 06.10.2022.
//

import UIKit

class ColorsViewController: UIViewController {
    
    let colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.backgroundColor = UIColor.cyan
        label.textAlignment = .center
        label.text = " 0 "
        return label
    }()

    let firstButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.yellow
        button.setTitle(" Вариант 1 ", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.yellow, for: .highlighted)
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.yellow
        button.setTitle(" Вариант 2 ", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.yellow, for: .highlighted)
        return button
    }()
    
    let thirdButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.yellow
        button.setTitle(" Вариант 3 ", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.yellow, for: .highlighted)
        return button
    }()
    
    let fourthButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.yellow
        button.setTitle(" Вариант 4 ", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.yellow, for: .highlighted)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        view.backgroundColor = UIColor.orange
        view.addSubview(colorLabel)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.addSubview(fourthButton)
        
        colorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colorLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -375).isActive = true
        firstButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -225).isActive = true
        
        secondButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        secondButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -175).isActive = true
        secondButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -25).isActive = true
        
        thirdButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        thirdButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 25).isActive = true
        thirdButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: 175).isActive = true
        
        fourthButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        fourthButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 225).isActive = true
        fourthButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: 375).isActive = true
    }

    
}

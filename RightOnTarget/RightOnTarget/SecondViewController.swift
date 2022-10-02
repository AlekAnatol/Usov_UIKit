//
//  SecondViewController.swift
//  RightOnTarget
//
//  Created by Екатерина Алексеева on 01.10.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let backToGameButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.yellow
        button.setTitle("  Back to game  ", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.yellow, for: .highlighted)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        print("loadView SecondViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad SecondViewController")
        view.addSubview(backToGameButton)
        setUI()
        backToGameButton.addTarget(self, action: #selector(backToGameButtonPressed), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear SecondViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear SecondViewController")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear SecondViewController")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear SecondViewController")
    }
    
    func setUI() {
        view.backgroundColor = UIColor.purple
        backToGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backToGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func backToGameButtonPressed(target: UIButton) {
        //if target.titleLabel?.text == "  Back to game  " {
        if target == self.backToGameButton {
            self.dismiss(animated: true)
        }
    }
}

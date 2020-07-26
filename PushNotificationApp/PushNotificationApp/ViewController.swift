//
//  ViewController.swift
//  TestApp
//
//  Created by Abhishek Kumar on 23/07/20.
//  Copyright © 2020 Abhishek. All rights reserved.
//

import UIKit
import PNFramework

class ViewController: UIViewController {
    
    let showStatusButton : UIButton = {
        $0.backgroundColor = .systemBlue
        $0.setTitle(" Status ", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(statusButtonAction(_:)), for: .touchUpInside)
        return $0
    }(UIButton())
    
    let subscribeButton : UIButton = {
        $0.backgroundColor = .systemBlue
        $0.setTitle(" Subcribe ", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(statusButtonAction(_:)), for: .touchUpInside)
        return $0
    }(UIButton())
    
    let permissionLabel : UILabel = {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.text = " Permission Information. "
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    var pnService = PAService.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        let stackView = UIStackView(arrangedSubviews: [permissionLabel ,subscribeButton,showStatusButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        view.addSubview(stackView)
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
                                     stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     stackView.heightAnchor.constraint(equalToConstant: 150)])
    }
    
    @objc func statusButtonAction(_ sender : UIButton) {
        switch sender {
        case showStatusButton:
            statusButtonClicked()
        case subscribeButton:
            clickSubscribe()
        default:
            break
        }
    }
    
    func statusButtonClicked() {
        updateInfoUI()
    }
    
    func clickSubscribe() {
        pnService.subscribe()
        updateInfoUI()
    }
    
    func updateInfoUI() {
     DispatchQueue.main.async { [weak self] in
        guard let servicePermission = self?.pnService else {
            return
        }
        let regStatus = servicePermission.getSubscriptionStatus() ? "sub" : "non-sub "
        self?.permissionLabel.text =  servicePermission.getPermission() ? " perm :- Granted & Reg status :- \(regStatus)" : " Failed "
        }
    }
}


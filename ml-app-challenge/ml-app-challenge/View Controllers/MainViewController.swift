//
//  ViewController.swift
//  ml-app-challenge
//
//  Created by Danica Weiler on 2021-10-28.
//

import UIKit

class MainViewController: UIViewController {

    let openButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 200, y: 100, width: 200, height: 50))
        button.backgroundColor = .green
        button.setTitle("Open", for: .normal)
        button.addTarget(self, action: #selector(openButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(openButton)
        
        view.addConstraints(
         [
            openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openButton.widthAnchor.constraint(equalToConstant: 200),
            openButton.heightAnchor.constraint(equalToConstant: 100)
         ])

    }
    
    @objc func openButtonAction(sender: UIButton!) {
        let accountsVC = AccountsViewController()
        self.navigationController?.pushViewController(accountsVC, animated: true)
    }
}


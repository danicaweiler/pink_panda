//
//  AccountsViewController.swift
//  ml-app-challenge
//
//  Created by Danica Weiler on 2021-10-28.
//

import UIKit

class AccountsViewController: UIViewController {
    
    var accountsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalSpacing
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let quitButton = UIBarButtonItem(title: "Quit", style: .plain, target: self, action: #selector(quitButtonAction))
        self.navigationItem.rightBarButtonItem = quitButton
        self.navigationItem.title = "Accounts"
        self.view.addSubview(accountsStack)
        
        self.view.addConstraints(
            [
                accountsStack.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 200),
                accountsStack.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -200),
                accountsStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                accountsStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
            ])
        
        getAccountData()
    }
    
    private func getAccountData() {
        let jsonData = readLocalJSONFile(forName: "data/listOfAccounts")
        if let data = jsonData {
            do {
                let accountList = try processData(data, model: [Account].self) as? [Account]
                var accountStacks: [UIStackView] = []
                
                if let accounts = accountList {
                    for account in accounts {
                        let accountStack = UIStackView()
                        accountStack.axis = .vertical
                        
                        let displayNameButton = UIButton()
                        displayNameButton.backgroundColor = .green
                        displayNameButton.setTitle("\(account.display_name) - \(account.account_number)", for: .normal)
                        displayNameButton.tag = account.id
                        displayNameButton.addTarget(self, action: #selector(showTransactionsAction), for: .touchUpInside)
                        
                        let balanceLabel = UILabel()
                        balanceLabel.text = "Balance: $\(account.balance)"
                        
                        accountStack.addArrangedSubview(displayNameButton)
                        accountStack.addArrangedSubview(balanceLabel)
                        
                        accountStacks.append(accountStack)
                    }
                    
                    
                    for stack in accountStacks {
                        accountsStack.addArrangedSubview(stack)
                    }
                }
            } catch {
                print("error: \(error)")
            }
        }
    }
    
    @objc func showTransactionsAction(sender: UIButton!) {
        let transactionVC = TransactionsViewController(accountId: sender.tag)
        self.navigationController?.present(transactionVC, animated: true)
    }
    
    @objc func quitButtonAction(sender: UIButton!) {
        exit(0)
    }
}

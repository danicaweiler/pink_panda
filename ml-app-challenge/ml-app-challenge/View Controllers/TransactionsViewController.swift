//
//  TransactionsViewController.swift
//  ml-app-challenge
//
//  Created by Danica Weiler on 2021-10-28.
//

import UIKit

class TransactionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let cellId = "TransactionCell"
    private var transactions: [Transaction] = []
    
    var transactionTable: UITableView = {
        let tblView = UITableView()
        tblView.translatesAutoresizingMaskIntoConstraints = false
        return tblView
    }()
    
    
    init(accountId: Int) {
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = .white
        transactionTable.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        transactionTable.dataSource = self
        transactionTable.delegate = self
        
        self.view.addSubview(transactionTable)
        self.view.addConstraints(
            [
                transactionTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
                transactionTable.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50),
                transactionTable.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                transactionTable.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
            ])
        
        getTransactionData(accountId: accountId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getTransactionData(accountId: Int) {
        var filename = "data/"
        
        switch accountId {
        case 10: //Chequing
            filename += "chequingAccount"
        case 12: //Savings
            filename += "savingsAccount"
        case 19: //TFSA
            filename += "TfsaAccount"
        default: //All
            filename += "accountTransactions"
        }
        
        let jsonData = readLocalJSONFile(forName: filename)
        
        if let data = jsonData {
            do {
                let transactions = try processData(data, model: [Transaction].self) as? [Transaction]
                if let transacitionList = transactions {
                    self.transactions = transacitionList
                }
            } catch {
                print("error: \(error)")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions[section].activity.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(transactions[section].date)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath as IndexPath)
        
        var amount = ""
        
        if let withdrawal = transactions[indexPath.section].activity[indexPath.row].withdrawal_amount {
            amount = "- $\(withdrawal)"
        }
        else if let deposit = transactions[indexPath.section].activity[indexPath.row].deposit_amount {
            amount = "$\(deposit)"
        }
        
        let info = """
            Amount: \(amount)
            Id: \(transactions[indexPath.section].activity[indexPath.row].transaction_uid)
            """
        
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping;
        cell.textLabel?.text = info
        
        return cell
    }
}

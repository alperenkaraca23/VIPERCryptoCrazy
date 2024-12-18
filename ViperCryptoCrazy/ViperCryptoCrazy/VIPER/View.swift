//
//  View.swift
//  ViperCryptoCrazy
//
//  Created by Alperen KARACA on 7.12.2024.
//

import Foundation
import UIKit

// Talks to -> Presenter

protocol AnyView {
    var presenter : AnyPresenter? { get set }
    
    func update(with cryptos : [Crypto])
    
    func update(with error: String)
}

class CryptoViewController : UIViewController, AnyView , UITableViewDelegate , UITableViewDataSource{
    var presenter: (any AnyPresenter)?
    
    var cryptos : [Crypto] = []
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        table.backgroundColor = .darkGray
        return table
    }()
    
    private let messageLabel : UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.text = "Loading..."
        label.textAlignment = .center
        label.textColor = .yellow
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 25, width:  200, height: 50)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cryptos[indexPath.row].currency
        content.secondaryText = cryptos[indexPath.row].price
        content.textProperties.color = .yellow
        content.secondaryTextProperties.color = .yellow
        cell.contentConfiguration = content
        cell.backgroundColor = .darkGray
        return cell
    }
    
    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.cryptos = []
            self.tableView.isHidden = true
            self.messageLabel.isHidden = false
            self.messageLabel.text = error 
        }
    }
    
    
}

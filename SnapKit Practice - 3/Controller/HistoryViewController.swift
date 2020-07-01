//
//  HistoryViewController.swift
//  SnapKit Practice - 3
//
//  Created by Farukh Iskalinov on 30.06.20.
//  Copyright © 2020 Farukh Iskalinov. All rights reserved.
//

import SnapKit
import UIKit


class HistoryViewController: UIViewController {
    var history: [String] = [String]()
    // Я хотел чтобы вы показали что усвоили материал по работе с table view
    // Вместо text view было бы лучше если использовался UILabel
    // text view позволяет вписывать данные в него
    // а label просто отображает текс
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .appOrange
        button.layer.cornerRadius = 15.0
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fill)
        [tableView, button].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    // Можно было бы в конструктор передавать историю (так было бы понятно что элемент history обязателен и его нужно сетить)
    init(data: [String]) {
        self.history = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(HistoryCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(stackView)
        
        button.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }
        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
            .inset(15)
        }

    }
    
    @objc private func didTapCloseButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HistoryCell else {
            return UITableViewCell()
            
        }
        cell.configure(historyText: history[indexPath.row])
        return cell
    }
    
    
}

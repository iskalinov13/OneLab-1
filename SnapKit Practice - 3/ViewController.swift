//
//  ViewController.swift
//  SnapKit Practice - 3
//
//  Created by Farukh Iskalinov on 28.06.20.
//  Copyright © 2020 Farukh Iskalinov. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    private lazy var outputLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 60, weight: .regular)
        label.textAlignment = .right
        label.text = "0"
        return label
    }()

    //MARK: Operation buttons
    private lazy var buttonAC: UIButton = {
        // Хорошо придумал использовать метод для создания одинаковых кнопок
        // но в подобное упрощение желательно реализовывать внутри этой же view
        // по факту, getButton ничего не дополняет
        // + этот метоз занимается созданием, а для этого есть конструкторы (можно было написать свой конструктор: тогда все было бы идеально)
        // same goes to myStackView()
        let button = UIButton(backgroundColor: .appGray, titleColor: .white, title: "AC")
        button.addTarget(self, action: #selector(didTapOperationButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonRoot: UIButton = {
        let button = UIButton(backgroundColor: .appGray, titleColor: .white, title: "√")
        button.addTarget(self, action: #selector(didTapOperationButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonSquare: UIButton = {
        let button = UIButton(backgroundColor: .appGray, titleColor: .white, title: "^")
        button.addTarget(self, action: #selector(didTapOperationButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonDivision: UIButton = {
        let button = UIButton(backgroundColor: .appOrange, titleColor: .white, title: "÷")
        button.addTarget(self, action: #selector(didTapOperationButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonMultiplication: UIButton = {
        let button = UIButton(backgroundColor: .appOrange, titleColor: .white, title: "×")
        button.addTarget(self, action: #selector(didTapOperationButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonMinus: UIButton = {
        let button = UIButton(backgroundColor: .appOrange, titleColor: .white, title: "-")
        button.addTarget(self, action: #selector(didTapOperationButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonAddition: UIButton = {
        let button = UIButton(backgroundColor: .appOrange, titleColor: .white, title: "+")
        button.addTarget(self, action: #selector(didTapOperationButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonEqual: UIButton = {
        let button = UIButton(backgroundColor: .appOrange, titleColor: .white, title: "=")
        button.addTarget(self, action: #selector(didTapOperationButton(_:)), for: .touchUpInside)
        return button
    }()
    
    //MARK: Number buttons
    private lazy var button7: UIButton = {
        let button = UIButton(backgroundColor: .appDarkGray, titleColor: .white, title: "7")
        button.addTarget(self, action: #selector(didTapDigitButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var button8: UIButton = {
        let button = UIButton(backgroundColor: .appDarkGray, titleColor: .white, title: "8")
        button.addTarget(self, action: #selector(didTapDigitButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var button9: UIButton = {
        let button = UIButton(backgroundColor: .appDarkGray, titleColor: .white, title: "9")
        button.addTarget(self, action: #selector(didTapDigitButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var button4: UIButton = {
        let button = UIButton(backgroundColor: .appDarkGray, titleColor: .white, title: "4")
        button.addTarget(self, action: #selector(didTapDigitButton(_:)), for: .touchUpInside)
        return button
    }()
    private lazy var button5: UIButton = {
        let button = UIButton(backgroundColor: .appDarkGray, titleColor: .white, title: "5")
        button.addTarget(self, action: #selector(didTapDigitButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var button6: UIButton = {
        let button = UIButton(backgroundColor: .appDarkGray, titleColor: .white, title: "6")
        button.addTarget(self, action: #selector(didTapDigitButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var button1: UIButton = {
        let button = UIButton(backgroundColor: .appDarkGray, titleColor: .white, title: "1")
        button.addTarget(self, action: #selector(didTapDigitButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton(backgroundColor: .appDarkGray, titleColor: .white, title: "2")
        button.addTarget(self, action: #selector(didTapDigitButton(_:)), for: .touchUpInside)
        return button
    }()
    private lazy var button3: UIButton = {
        let button = UIButton(backgroundColor: .appDarkGray, titleColor: .white, title: "3")
        button.addTarget(self, action: #selector(didTapDigitButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var button0: UIButton = {
        let button = UIButton(backgroundColor: .appDarkGray, titleColor: .white, title: "0")
        button.addTarget(self, action: #selector(didTapDigitButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonHistory: UIButton = {
        let button = UIButton(backgroundColor: .appDarkGray, titleColor: .white, title: "H")
        button.addTarget(self, action: #selector(didTapHistoryButton(_:)), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: Horizontal StackViews
    private lazy var stackView1: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually)
        [buttonAC, buttonRoot, buttonSquare, buttonDivision].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    private lazy var stackView2: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually)
        [button7, button8, button9, buttonMultiplication].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    private lazy var stackView3: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually)
        [button4, button5, button6, buttonMinus].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    private lazy var stackView4: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually)
        [button1, button2, button3, buttonAddition].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    private lazy var stackView5: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually)
        [buttonHistory, buttonEqual].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    private lazy var stackView6: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually)
        [button0, stackView5].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    private lazy var stackViewButtons: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fillEqually)
        [stackView1, stackView2, stackView3, stackView4, stackView6].forEach {
            stackView.addArrangedSubview($0)
        }
        stackView.backgroundColor = .yellow
        return stackView
    }()
    
    //MARK: Vertical StackViews
    private lazy var stackViewMain: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fillProportionally)
        [outputLabel, stackViewButtons].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView

    }()
    
    //MARK: Main Logic
    private var typing: Bool = false
    private var displayValue: Double {
        get {
            return Double(outputLabel.text!)!
        }
        set {
            outputLabel.text = String(newValue)
        }
    }
    private var calculator = CalculatorModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    func layoutUI() {
        view.backgroundColor = .black
        view.addSubview(stackViewMain)
        // Это круто что ты использовал UIEdgeInsets для того чтобы задать отступы, но в случаях когда отступы одинаковы желательно просто передавать число
        // make.edges.equalTo(view.safeAreaLayoutGuide).inset(15)
        stackViewMain.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        outputLabel.snp.makeConstraints { (make) in
            make.size.height.equalTo(150)
        }
    }
        
    //MARK: #Selector functions
    @objc private func didTapOperationButton(_ sender: UIButton){
        calculator.setOperand(displayValue)
        calculator.performOperation(sender.currentTitle!)
        displayValue = calculator.getResult()!
        typing = false
    }
    @objc private func didTapDigitButton(_ sender: UIButton){
        
        let currentDigit = sender.currentTitle!
        if typing {
            let currentdisplay = outputLabel.text!
            outputLabel.text = currentdisplay + currentDigit
        } else {
            outputLabel.text = currentDigit
            typing = true
        }
    }
    
    @objc private func didTapHistoryButton(_ sender: UIButton){
        let history = calculator.getHistory()
        print(history)
        let viewController = HistoryViewController(data: history)
        viewController.isModalInPresentation = true
        viewController.modalTransitionStyle = .flipHorizontal
        present(viewController, animated: true, completion: nil)
    }
     
}


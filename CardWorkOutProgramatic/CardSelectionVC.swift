//
//  CardSelectionVC.swift
//  CardWorkOutProgramatic
//
//  Created by Abdirizak Hassan on 10/20/21.
//

import UIKit

class CardSelectionVC: UIViewController {

    let cardImageView = UIImageView()
    let stopBtn  = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetBtn = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesBtn = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    var cards = Card.allValues
    
    var time: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTime()
    }
    
     func startTime() {
        time = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func StopButton() {
        time?.invalidate()
    }
    
    @objc func restartButton() {
        time?.invalidate()
        startTime()
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }

    func configureUI() {
        configureCardImageView()
        configureStoppBtn()
        configureResetBtn()
        configureRulesBtn()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStoppBtn() {
        view.addSubview(stopBtn)
        stopBtn.addTarget(self, action: #selector(StopButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stopBtn.widthAnchor.constraint(equalToConstant: 260),
            stopBtn.heightAnchor.constraint(equalToConstant: 50),
            stopBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopBtn.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30),
        ])
    }
    
    func configureResetBtn() {
        view.addSubview(resetBtn)
        resetBtn.addTarget(self, action: #selector(restartButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resetBtn.widthAnchor.constraint(equalToConstant: 115),
            resetBtn.heightAnchor.constraint(equalToConstant: 50),
            resetBtn.leadingAnchor.constraint(equalTo: stopBtn.leadingAnchor),
            resetBtn.topAnchor.constraint(equalTo: stopBtn.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesBtn() {
        view.addSubview(rulesBtn)
        rulesBtn.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rulesBtn.widthAnchor.constraint(equalToConstant: 115),
            rulesBtn.heightAnchor.constraint(equalToConstant: 50),
            rulesBtn.trailingAnchor.constraint(equalTo: stopBtn.trailingAnchor),
            rulesBtn.topAnchor.constraint(equalTo: stopBtn.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func presentRulesVC() {
        let rulesVC = RulesCV()
        present(rulesVC, animated: true)
    }
    
}

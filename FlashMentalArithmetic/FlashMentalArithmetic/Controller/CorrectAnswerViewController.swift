//
//  AnswerViewController.swift
//  FlashMentalArithmetic
//
//  Created by 徳永勇希 on 2021/03/25.
//

import UIKit

class CorrectAnswerViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    var receiveTrueAnswer = 0
    var receiveMyAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer(receiveTrueAnswer: receiveTrueAnswer, receiveMyAnswer: receiveMyAnswer)
    }
    
    func answer(receiveTrueAnswer:Int,receiveMyAnswer:Int){
        
        if receiveTrueAnswer == receiveMyAnswer {
            answerLabel.text = "◯"
            explanationLabel.text = "正解です！\n次の問題に挑戦しよう！"
        } else {
            answerLabel.text = "×"
            explanationLabel.text = "正解は\(receiveTrueAnswer)\nもう一度問題に挑戦しよう！"
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

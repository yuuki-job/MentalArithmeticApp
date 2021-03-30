//
//  AnswerViewController.swift
//  FlashMentalArithmetic
//
//  Created by 徳永勇希 on 2021/03/25.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet private weak var answerLabel: UILabel!
    @IBOutlet private weak var explanationLabel: UILabel!
    var total = 0
    var myAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer(total: total, myAnswer: myAnswer)
    }
    
    func answer(total:Int,myAnswer:Int){
        if total == myAnswer {
            answerLabel.text = "◯"
            explanationLabel.text = "正解です！\n次の問題に挑戦しよう！"
        } else {
            answerLabel.text = "×"
            explanationLabel.text = "正解は\(total)\nもう一度問題に挑戦しよう！"
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

//
//  PlayMentalArithmeticViewController.swift
//  FlashMentalArithmetic
//
//  Created by 徳永勇希 on 2021/03/24.
//

import UIKit

class PlayMentalArithmeticViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var answerTextField: UITextField!
    @IBOutlet private weak var decisionButtonStatus: UIButton!
    @IBOutlet private weak var startButtonStatus: UIButton!
    
    private var timer = Timer()
    private var result = 0
    private var level: Level = .level1
    private var interval:Interval = .easy
    private var max = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerTextField.isHidden = true
        decisionButtonStatus.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func decisionButton(_ sender: Any) {
        if answerTextField.text?.isEmpty == true {
            let alert = UIAlertController(title: "答えを入力してください", message: nil, preferredStyle: .alert)
            // 確定ボタンの処理
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        } else {
            decisionButtonStatus.isEnabled = true
            let correctAnswerVC = storyboard?.instantiateViewController(withIdentifier: "correctAnswerVC") as! ResultViewController
            correctAnswerVC.total = result
            correctAnswerVC.myAnswer = Int(answerTextField.text!)!
            self.present(correctAnswerVC, animated: true, completion:nil)
        }
    }
    //問題開始
    @IBAction func startButton(_ sender: Any) {
        timerSet()
        startButtonStatus.isHidden = true
    }
    
    func timerSet() {
        switch level {
        case .level1:
            interval = .easy
            max = 10
        case .level2:
            interval = .hard
            max = 10
        case .level3:
            interval = .easy
            max = 100
        case .level4:
            interval = .hard
            max = 100
        case .level5:
            interval = .hard
            max = 1000
        case .level6:
            interval = .hard
            max = 10000
        }
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(interval.rawValue), target: self, selector: #selector(self.startTimerLevel), userInfo: nil, repeats: true)
    }
    
    @objc func startTimerLevel(){
        let value = Int.random(in: 0...max)
        self.label.text = String(value)
        result += Int(self.label.text!)!
        print(result)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.timer.invalidate()
            self.answerTextField.isHidden = false
            self.decisionButtonStatus.isHidden = false
        }
    }
}

extension PlayMentalArithmeticViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

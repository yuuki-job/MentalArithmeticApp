//
//  PlayMentalArithmeticViewController.swift
//  FlashMentalArithmetic
//
//  Created by 徳永勇希 on 2021/03/24.
//

import UIKit

class PlayMentalArithmeticViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var decisionButtonStatus: UIButton!
    @IBOutlet weak var startButtonStatus: UIButton!
    
    var receiveIndex = 0
    private var timer = Timer()
    var rezult = 0
    
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
            let correctAnswerVC = storyboard?.instantiateViewController(withIdentifier: "correctAnswerVC") as! CorrectAnswerViewController
            correctAnswerVC.receiveTrueAnswer = rezult
            correctAnswerVC.receiveMyAnswer = Int(answerTextField.text!)!
            self.present(correctAnswerVC, animated: true, completion:nil)
        }
    }
    //問題開始
    @IBAction func startButton(_ sender: Any) {
        timerSet()
        startButtonStatus.isHidden = true
    }
    
    func timerSet() {
        switch receiveIndex {
        case 0:
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.startTimerLevel1), userInfo: nil, repeats: true)
        case 1:
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.startTimerLevel2), userInfo: nil, repeats: true)
        case 2:
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.startTimerLevel3), userInfo: nil, repeats: true)
        case 3:
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.startTimerLevel4), userInfo: nil, repeats: true)
        case 4:
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.startTimerLevel5), userInfo: nil, repeats: true)
        case 5:
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.startTimerLevel6), userInfo: nil, repeats: true)
        default:
            break
        }
    }
    
    @objc func startTimerLevel1(){
        wait(value: Int.random(in: 0...10)) {
            self.timer.invalidate()
            self.answerTextField.isHidden = false
            self.decisionButtonStatus.isHidden = false
            //self.decisionButtonStatus.isEnabled = false
        }
    }
    
    @objc func startTimerLevel2(){
        wait(value: Int.random(in: 0...10)) {
            self.timer.invalidate()
            self.answerTextField.isHidden = false
            self.decisionButtonStatus.isHidden = false
            //self.decisionButtonStatus.isEnabled = false
        }
    }
    
    @objc func startTimerLevel3(){
        wait(value: Int.random(in: 0...100)) {
            self.timer.invalidate()
            self.answerTextField.isHidden = false
            self.decisionButtonStatus.isHidden = false
            //self.decisionButtonStatus.isEnabled = false
        }
    }
    
    @objc func startTimerLevel4(){
        wait(value: Int.random(in: 0...100)) {
            self.timer.invalidate()
            self.answerTextField.isHidden = false
            self.decisionButtonStatus.isHidden = false
            //self.decisionButtonStatus.isEnabled = false
        }
    }
    
    @objc func startTimerLevel5(){
        wait(value: Int.random(in: 0...1000)) {
            self.timer.invalidate()
            self.answerTextField.isHidden = false
            self.decisionButtonStatus.isHidden = false
            //self.decisionButtonStatus.isEnabled = false
        }
    }
    
    @objc func startTimerLevel6(){
        wait(value: Int.random(in: 0...10000)) {
            self.timer.invalidate()
            self.answerTextField.isHidden = false
            self.decisionButtonStatus.isHidden = false
            //self.decisionButtonStatus.isEnabled = false
        }
    }
    
    func wait(value:Int,compleation: @escaping () -> Void) {
        self.label.text = String(value)
        rezult += Int(self.label.text!)!
        print(rezult)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            compleation()
        }
    }
}

extension PlayMentalArithmeticViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
}

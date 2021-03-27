//
//  ViewController.swift
//  FlashMentalArithmetic
//
//  Created by 徳永勇希 on 2021/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let nameArray = ["レベル1","レベル2","レベル3","レベル4","レベル5","レベル6",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetUp()
        navigationSetup()
    }
    
    func collectionViewSetUp() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
    
    func navigationSetup() {
        self.navigationController?.navigationBar.barTintColor = .systemPurple
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.roundView.layer.cornerRadius = 20
        cell.roundView.layer.shadowColor = UIColor.black.cgColor //影の色を決める
        cell.roundView.layer.shadowOpacity = 1 //影の色の透明度
        cell.roundView.layer.shadowRadius = 5 //影のぼかし
        cell.roundView.layer.shadowOffset = CGSize(width: 3, height: 3) //影の方向　width、heightを負の値にすると上の方に影が表示される
        for _ in 1...6 {
            cell.displayLabel.text = nameArray[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/2
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let playVC = storyboard?.instantiateViewController(identifier: "playVC") as! PlayMentalArithmeticViewController
        playVC.receiveIndex = indexPath.row
        playVC.modalPresentationStyle = .fullScreen
        present(playVC, animated: true, completion: nil)
    }
}

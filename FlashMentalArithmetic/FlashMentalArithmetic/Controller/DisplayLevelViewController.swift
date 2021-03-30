//
//  ViewController.swift
//  FlashMentalArithmetic
//
//  Created by 徳永勇希 on 2021/03/24.
//

import UIKit

final class DisplayLevelViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    private let levelArray = ["レベル1","レベル2","レベル3","レベル4","レベル5","レベル6",]
    private let nibId = String(describing: CollectionViewCell.self)
    private let cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetUp()
        navigationSetup()
    }
    
    private func collectionViewSetUp() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: nibId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    private func navigationSetup() {
        self.navigationController?.navigationBar.barTintColor = .systemPurple
        //ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
}

extension DisplayLevelViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.configureCell(level: levelArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let playVC = storyboard?.instantiateViewController(identifier: "playVC") as! PlayMentalArithmeticViewController
        playVC.level = Level(rawValue: indexPath.row)!
        playVC.modalPresentationStyle = .fullScreen
        present(playVC, animated: true, completion: nil)
    }
}

//
//  HomeViewController.swift
//  iOSDoMore
//
//  Created by Abduqaxxor on 22/1/22.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    let numberOfColumns: CGFloat = 2
    var items: Array<Item> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
       initViews()
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        items.append(Item(title: "Best Coding", image: "image1"))
        items.append(Item(title: "Amazing Code", image: "image2"))
        items.append(Item(title: "Best Coding", image: "image1"))
        items.append(Item(title: "Amazing Code", image: "image2"))
        items.append(Item(title: "Best Coding", image: "image1"))
        items.append(Item(title: "Amazing Code", image: "image2"))
        items.append(Item(title: "Best Coding", image: "image1"))
        items.append(Item(title: "Amazing Code", image: "image2"))
        items.append(Item(title: "Best Coding", image: "image1"))
        items.append(Item(title: "Amazing Code", image: "image2"))
       
    }
    
    
    // MARK: - Methods
    
    func initViews(){
       
        addNavBar()
    }
    
    func addNavBar(){
        let scroll = UIImage(named: "ic_scroll")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(scrollTaped))
        
        title = "Collection View"
    }
    
    func callScrollViewController(){
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Action
    
    @objc func scrollTaped(){
        callScrollViewController()
    }
    
    // MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.nameLabel.text = item.title
        cell.imageView.image = UIImage(named: item.image!)
        
        return cell
    }
}

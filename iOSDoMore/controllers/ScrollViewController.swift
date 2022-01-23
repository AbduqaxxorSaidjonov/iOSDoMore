//
//  ScrollViewController.swift
//  iOSDoMore
//
//  Created by Abduqaxxor on 22/1/22.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     initViews()
    }


    // MARK: - Navigation


    // MARK: - Methods
    func initViews(){
        addNavigationBar()
    }
    
    func addNavigationBar(){
        let back = UIImage(named: "ic_back")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(leftTapped))
        title = "Scroll View"
    }
    // MARK: - Action
    
    @objc func leftTapped(){
        navigationController?.popViewController(animated: true)
    }
}

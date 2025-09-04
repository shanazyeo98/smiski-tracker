//
//  HomeVC.swift
//  smiski tracker
//
//  Created by Shanaz Yeo on 4/9/25.
//

import UIKit
import Gifu


class HomeVC: UIViewController {
    let imageView = GIFImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // Do any additional setup after loading the view.
        
        imageView.frame = CGRect(x: 50, y: 100, width: 400, height: 400)
        view.addSubview(imageView)
        imageView.animate(withGIFNamed: "smiski_main")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}

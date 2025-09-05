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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        displayDefaultAnimation()
    }
    
    func displayDefaultAnimation() {
        let side: CGFloat = 300
        let x: CGFloat = (view.bounds.width - side) / 2
        let y: CGFloat = (view.bounds.height - side) / 2
        imageView.frame = CGRect(x: x, y: y, width: side, height: side)
        view.addSubview(imageView)
        imageView.animate(withGIFNamed: "smiski_main")
    }
}

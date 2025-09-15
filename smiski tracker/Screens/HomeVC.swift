//
//  HomeVC.swift
//  smiski tracker
//
//  Created by Shanaz Yeo on 4/9/25.
//

import UIKit
import Gifu


class HomeVC: UIViewController {
    
    var side: CGFloat!
    var x: CGFloat!
    var y: CGFloat!
    let imageView = GIFImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        side = 300
        x = (view.bounds.width - side) / 2
        y = (view.bounds.height - side) / 2
        imageView.frame = CGRect(x: x, y: y, width: side, height: side)
        view.addSubview(imageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(displayTapAnimation))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        displayDefaultAnimation()
    }
    
    @objc func displayDefaultAnimation() {
        imageView.animate(withGIFNamed: "smiski_main")
    }
    
    @objc func displayTapAnimation() {
        imageView.animate(withGIFNamed: "smiski_tapped", loopCount: 1, loopBlock: {
            DispatchQueue.main.async {
                self.displayDefaultAnimation()
            }
        })
    }
    
    
}

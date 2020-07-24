//
//  ViewController.swift
//  DoubleTapLike
//
//  Created by Afsal's Macbook Pro on 24/07/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "green")
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width)
        imageView.center = view.center
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)
        
    }
    
    @objc private func handleDoubleTap(_ gesture: UITapGestureRecognizer) {
        guard let gestureView = gesture.view else {
            return
        }
        
        let size = gestureView.frame.size.width / 4
        let heart = UIImageView(image: UIImage(systemName: "heart.fill"))
        heart.frame = CGRect(x: (gestureView.frame.size.width - size) / 2,
                             y: (gestureView.frame.size.width - size) / 2,
                             width: size,
                             height: size)
        heart.tintColor = .white
        heart.alpha = 0
        gestureView.addSubview(heart)
        
       UIView.animate(withDuration: 0.5, animations: {
            heart.alpha = 1
        }, completion: {
            if $0 {
                UIView.animate(withDuration: 1, animations: {
                    heart.alpha = 0
                }, completion: { done in
                    if done {
                        heart.removeFromSuperview()
                    }
                })
            }
        })
    }
}


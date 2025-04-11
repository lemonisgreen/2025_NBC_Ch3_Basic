//
//  LaunchViewController.swift
//  Kiosk
//
//  Created by 최규현 on 4/11/25.
//

import UIKit

class LaunchViewController: UIViewController {
    
    var launchIamge: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Launch")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpImage()
    }
}

extension LaunchViewController {
    
    func setUpImage() {
        view.backgroundColor = .main
        view.addSubview(launchIamge)
        
        NSLayoutConstraint.activate([
            launchIamge.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            launchIamge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            launchIamge.widthAnchor.constraint(equalTo: view.widthAnchor),
            launchIamge.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}

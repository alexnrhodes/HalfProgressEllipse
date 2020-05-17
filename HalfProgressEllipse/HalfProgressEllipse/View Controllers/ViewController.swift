//
//  ViewController.swift
//  HalfProgressEllipse
//
//  Created by Alex Rhodes on 5/16/20.
//  Copyright © 2020 Alex Rhodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var progressBar: ARHalfEllipseProgressView!
    var timer: Timer!
    var progressCounter:Float = 0
    let duration:Float = 10.0
    var progressIncrement:Float = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let progressView = ARHalfEllipseProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressView)
        self.progressBar = progressView
        
        progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        progressIncrement = 1.0/duration
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.showProgress), userInfo: nil, repeats: true)
        
    }


    @objc func showProgress() {
       if(progressCounter > 1.0){timer.invalidate()}
       progressBar.progress = progressCounter
       progressCounter = progressCounter + progressIncrement
       }
}


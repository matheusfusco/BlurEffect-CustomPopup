//
//  ViewController.swift
//  CustomViewWithoutSubclassing
//
//  Created by Matheus on 20/03/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.buildPopup(headline: "Hello", body: "Test popup"))
    }
}

extension ViewController {
    func buildPopup(icon: String = "ⓘ", headline headlineText: String, body bodyText: String) -> UIView {
        let container = UIView(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height/2 - 75, width: 150, height: 150))
        container.layer.cornerRadius = 20.0
        container.layer.masksToBounds = true
        container.backgroundColor = .clear
        
        let header = UILabel(text: icon, style: UIFont.TextStyle.largeTitle)
        let headline = UILabel(text: headlineText, style: UIFont.TextStyle.body)
        let body = UILabel(text: bodyText, style: UIFont.TextStyle.caption1)
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: nil)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
//        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
//        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
//        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(blurView)
//        blurView.contentView.addSubview(vibrancyView)
        
        let stack = UIStackView(arrangedSubviews: [header, headline, body])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.alpha = 0
        container.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: container.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: container.widthAnchor),
//            vibrancyView.heightAnchor.constraint(equalTo: container.heightAnchor),
//            vibrancyView.widthAnchor.constraint(equalTo: container.widthAnchor),
            stack.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            stack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            stack.widthAnchor.constraint(equalTo: container.widthAnchor)
            ])
        
        UIView.animate(withDuration: 1) {
            blurView.effect = blurEffect
            stack.alpha = 1
        }
        
        return container
    }
}

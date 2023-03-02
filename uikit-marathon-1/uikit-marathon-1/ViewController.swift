//
//  ViewController.swift
//  uikit-marathon-1
//
//  Created by Timur Taneev on 01.03.2023.
//
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // тень
        let shadowView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOpacity = 0.7
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 20).cgPath
        
        // "верхняя" вью с закругленными углами
        let roundedView = UIView(frame: shadowView.bounds)
        roundedView.layer.cornerRadius = 20
        roundedView.layer.masksToBounds = true

        // добавляем градиент
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = roundedView.bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        roundedView.layer.addSublayer(gradientLayer)

        // встраиваем в общую иерархию
        shadowView.addSubview(roundedView)
        view.addSubview(shadowView)
        
        // фиксируем расположение с помощью Autolayout
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shadowView.widthAnchor.constraint(equalToConstant: 100),
            shadowView.heightAnchor.constraint(equalToConstant: 100),
            roundedView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            roundedView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            roundedView.heightAnchor.constraint(equalTo: shadowView.heightAnchor),
            roundedView.widthAnchor.constraint(equalTo: shadowView.widthAnchor)
        ])
    }
}


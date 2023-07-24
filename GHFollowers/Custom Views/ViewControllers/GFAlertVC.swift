//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by Tanya on 28.12.2022.
//

import UIKit

 final class GFAlertVC: UIViewController {

    private let containerView = GFAlertContainerView()
    
    private lazy var titleLabel: GFTitleLabel = {
        let label = GFTitleLabel(textAlignment: .center, fontSize: 20)
        label.text = alertTitle ?? "Something went wrong"
        return label
    }()
     
     private lazy var messageLabel: GFBodyLabel = {
         let label = GFBodyLabel(textAlignment: .center)
         label.text = message ?? "Unable to complete request"
         label.numberOfLines = 4
         return label
     }()
     
     private lazy var actionButton: GFButton = {
         let button = GFButton(backgroundColor: .systemPink, title: "Ok")
         button.setTitle(buttonTitle ?? "Ok", for: .normal)
         button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
         return button
     }()
     
     private var alertTitle: String?
     private var message: String?
     private var buttonTitle: String?
     private let padding: CGFloat = 20
     
     init(title: String, message: String, buttonTitle: String) {
         super.init(nibName: nil, bundle: nil)
         self.alertTitle = title
         self.message = message
         self.buttonTitle = buttonTitle
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        configureUI()
    }
     
     @objc func dismissVC() {
         dismiss(animated: true)
     }
     
     private func configureUI() {         
         view.addSubviews(containerView, titleLabel, actionButton, messageLabel)
         
         NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
         ])
     }
}

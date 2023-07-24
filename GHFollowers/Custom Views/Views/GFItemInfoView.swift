//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Tanya on 06.01.2023.
//

import UIKit

enum ItemInfoType {
    case repos, gists, followers, following
}

final class GFItemInfoView: UIView {
    
    let symbleImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews(symbleImageView, titleLabel, countLabel)
        
        symbleImageView.translatesAutoresizingMaskIntoConstraints = false
        symbleImageView.contentMode = .scaleAspectFill
        symbleImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbleImageView.topAnchor.constraint(equalTo: topAnchor),
            symbleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            symbleImageView.widthAnchor.constraint(equalToConstant: 20),
            symbleImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbleImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbleImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbleImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbleImageView.image = SFSymbols.repos
            titleLabel.text = "Public Repos"
        case .gists:
            symbleImageView.image = SFSymbols.gists
            titleLabel.text = "Public Gists"
        case .followers:
            symbleImageView.image = SFSymbols.followers
            titleLabel.text = "Followers"
        case .following:
            symbleImageView.image = SFSymbols.following
            titleLabel.text = "Following"
        }
        countLabel.text = String(count)
    }
}

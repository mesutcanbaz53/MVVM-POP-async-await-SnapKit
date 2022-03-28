//
//  ItemCell.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation
import UIKit

final class ItemCell: BaseCollectionViewCell {
    
    //MARK: - Views
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    private lazy var containerStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [itemImageView,
                                                 nameLabel,
                                                 priceLabel,
                                                 dateLabel])
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 8.0
        view.axis = .vertical
        return view
    }()
        
    //MARK: - UI Configurations
    override func setUpViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(containerStackView)
    }
    
    override func setUpConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
}

//MARK: - Cell Configuration
extension ItemCell {
    
    func setCell(result: Results?) {
        itemImageView.setImage(urlString: result?.artworkUrl100 ?? "")
        nameLabel.text = result?.collectionName
        if let price = result?.collectionPrice {
            priceLabel.text = "\(price)"
        }
        dateLabel.text = result?.humanReadableDate
    }
}

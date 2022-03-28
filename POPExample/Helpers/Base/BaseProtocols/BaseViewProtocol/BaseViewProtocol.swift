//
//  stackView.snp.makeConstraints { make in             make.left.right.equalToSuperview().inset(padding)             make.bottom.equalTo(view.safeAreaLayoutGuide)             make.top.equalTo(view.safeAreaLayoutGuide)         }.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation

protocol BaseViewProtocol {
    func setUpViews()
    func setUpConstraints()
}

//
//  MainView.swift
//  assignment
//
//  Created by Chris Chen on 2019/3/19.
//  Copyright © 2019 Dev4App. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {

    let backgroundImageView = UIImageView()
    let bulletLabel = UILabel()
    let bulletCountLabel = UILabel()
    let missile1Button = MissileTypeButton()
    let missile2Button = MissileTypeButton()
    let missile3Button = MissileTypeButton()
    let fireButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addContentSubview()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addContentSubview() {
        
        // backgroundImageView
        backgroundImageView.image = UIImage(named: "background")
        addSubview(backgroundImageView)
        
        // bulletLabel
        bulletLabel.text = "Bullet Count"
        bulletLabel.textColor = .white
        bulletLabel.sizeToFit()
        bulletLabel.adjustsFontSizeToFitWidth = true
        bulletLabel.textAlignment = .center
        addSubview(bulletLabel)
        
        // bulletCountLabel
        bulletCountLabel.text = "100"
        bulletCountLabel.textColor = .white
        bulletCountLabel.font = bulletLabel.font.withSize(40)
        bulletCountLabel.adjustsFontSizeToFitWidth = true
        bulletCountLabel.textAlignment = .center
        addSubview(bulletCountLabel)
        
        // missile1Button
        missile1Button.setupImage(withImageString: "missile-type-1")
        addSubview(missile1Button)
        
        // missile2Button
        missile2Button.setupImage(withImageString: "missile-type-2")
        addSubview(missile2Button)
        
        // missile3Button
        missile3Button.setupImage(withImageString: "missile-type-3")
        addSubview(missile3Button)
        
        // fireButton
        let fireImage = UIImage(named: "fire")
        fireButton.setImage(fireImage, for: .normal)
        addSubview(fireButton)
        
        addContentSubviewConstraints()

    }
    
    func addContentSubviewConstraints() {

        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        bulletLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.top.equalTo(backgroundImageView.snp.top).offset(16)
            make.leading.equalTo(backgroundImageView.snp.leading).offset(15)
            make.trailing.equalTo(missile1Button.snp.leading).offset(-5)
        }
        
        bulletCountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(bulletLabel.snp.bottom)
            make.bottom.equalTo(missile1Button.snp.bottom)
            make.leading.equalTo(backgroundImageView.snp.leading).offset(15)
            make.trailing.equalTo(missile1Button.snp.leading).offset(-5)
        }
        
        missile1Button.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.top.equalTo(backgroundImageView.snp.top).offset(15)
            make.trailing.equalTo(missile2Button.snp.leading)
        }
        
        missile2Button.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.top.equalTo(backgroundImageView.snp.top).offset(15)
            make.trailing.equalTo(missile3Button.snp.leading)
        }
        
        missile3Button.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.top.equalTo(backgroundImageView.snp.top).offset(15)
            make.trailing.equalTo(backgroundImageView.snp.trailing).offset(-15)
        }
        
        fireButton.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.centerX.equalTo(backgroundImageView.snp.centerX)
            make.bottom.equalToSuperview().offset(-40)
        }
    }
}

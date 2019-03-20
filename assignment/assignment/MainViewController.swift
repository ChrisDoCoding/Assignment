//
//  MainViewController.swift
//  assignment
//
//  Created by Chris Chen on 2019/3/19.
//  Copyright © 2019 Dev4App. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var mainView = MainView()
    var plane = UIImageView()
    var missileType = MissileType.missileType_1
    var bullet = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = MainView(frame: view.bounds)
        // default missile is type 1
        mainView.missile1Button.isEnabled = false
        mainView.missile1Button.addTarget(self, action: #selector(missile1ButtonTapped(_:)), for: .touchUpInside)
        mainView.missile2Button.addTarget(self, action: #selector(missile2ButtonTapped(_:)), for: .touchUpInside)
        mainView.missile3Button.addTarget(self, action: #selector(missile3ButtonTapped(_:)), for: .touchUpInside)
        mainView.fireButton.addTarget(self, action: #selector(fireButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { (make) in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
                make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
                make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            } else {
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
            }
        }
        
        let planeImage = UIImage(named: "plane")
        plane.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        plane.image = planeImage
        plane.center = CGPoint(x: (view.frame.width / 2), y: (view.frame.height * 3 / 4) - 80)
        mainView.addSubview(plane)
    }
    
    // Mark - Help Function
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches ) {
            let location = touch.location(in: mainView)
            
            if plane.frame.contains(location) {
                plane.center = location
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches ) {
            let location = touch.location(in: mainView)
            
            if plane.frame.contains(location) {
                plane.center = location
            }
        }
    }
    
    func initMissileButtons() {
        mainView.missile1Button.isEnabled = true
        mainView.missile2Button.isEnabled = true
        mainView.missile3Button.isEnabled = true
    }
    
    
    @objc func missile1ButtonTapped(_ sender: UIButton) {
        initMissileButtons()
        missileType = .missileType_1
        mainView.missile1Button.isEnabled = false
    }
    
    @objc func missile2ButtonTapped(_ sender: UIButton) {
        initMissileButtons()
        missileType = .missileType_2
        mainView.missile2Button.isEnabled = false
    }
    
    @objc func missile3ButtonTapped(_ sender: UIButton) {
        initMissileButtons()
        missileType = .missileType_3
        mainView.missile3Button.isEnabled = false
    }
    
    @objc func fireButtonTapped(_ sender: UIButton) {
 
        var missile: Missile?
        
        switch missileType {
        case .missileType_1:
            missile = MissileType_1()
        case .missileType_2:
            missile = MissileType_2()
        case .missileType_3:
            missile = MissileType_3()
        }
        
        if let missile = missile {
            
            if bullet - missile.costs >= 0 {
                bullet -= missile.costs
                mainView.bulletCountLabel.text = String(bullet)
                
                let aImage = UIImageView()
                aImage.image = missile.image
                aImage.contentMode = .scaleAspectFit
                aImage.frame = CGRect(x: 0, y: 0, width: missile.size.width, height: missile.size.height)
                aImage.center = CGPoint(x: plane.center.x, y: plane.center.y-60)
                
                mainView.addSubview(aImage)
                
                UIView.animate(withDuration: missile.speed,
                               delay: 0.0,
                               options: [UIView.AnimationOptions.transitionCurlUp, .curveLinear],
                               animations: { () -> Void in
                                aImage.center.y = 0
                                
                }, completion: { (finished: Bool) -> Void in
                    aImage.removeFromSuperview()
                })
            } else {
                let alert = UIAlertController(title: "Error", message: "You don't have enough bullet.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
}

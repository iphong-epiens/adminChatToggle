//
//  ViewController.swift
//  InsertView
//
//  Created by Inpyo Hong on 2021/10/08.
//

import UIKit

enum AdminChatType: Int {
    case normal = 0, notice, pr, mc
}

class ViewController: UIViewController {
    var bgView: UIView!
    
    var adminNormalBtn: UIButton!
    var adminNoticeBtn: UIButton!
    var adminPrBtn: UIButton!
    var adminMcBtn: UIButton!
    
    var adminChatBtnArray = [UIButton]()
    
    var adminChatType: AdminChatType = .normal {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                       
                print("adminChatType", self.adminChatType)
                
                for (index, btn) in self.adminChatBtnArray.enumerated() {
                    btn.isHidden = index == self.adminChatType.rawValue ? false : true
                    print(btn.tag)
                }
                
                self.bgView.bringSubviewToFront(self.adminChatBtnArray[self.adminChatType.rawValue])
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configBtnView()
    }
}


extension ViewController {
    
    func configBtnView() {
        bgView = UIView(frame: CGRect(x: 20, y: 100, width: 20, height: 20))
        bgView.backgroundColor = .clear
        
        adminNormalBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        adminNormalBtn.setImage(UIImage(named: "iconChatNormal"), for: .normal)
        adminNormalBtn.tag = AdminChatType.normal.rawValue
        adminNormalBtn.addTarget(self, action: #selector(tapadminNormalBtn), for: .touchUpInside)
        adminNormalBtn.isHidden = true
        
        adminChatBtnArray.append(adminNormalBtn)
        
        bgView.insertSubview(adminNormalBtn, at: 0)
        
        adminNoticeBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        adminNoticeBtn.setImage(UIImage(named: "iconChatNotice"), for: .normal)
        adminNoticeBtn.tag = AdminChatType.notice.rawValue
        adminNoticeBtn.addTarget(self, action: #selector(tapadminNoticeBtn), for: .touchUpInside)
        adminNoticeBtn.isHidden = true
        
        adminChatBtnArray.append(adminNoticeBtn)
        
        bgView.insertSubview(adminNoticeBtn, at: 1)
        
        adminPrBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        adminPrBtn.setImage(UIImage(named: "iconChatPr"), for: .normal)
        adminPrBtn.tag = AdminChatType.pr.rawValue
        adminPrBtn.addTarget(self, action: #selector(tapadminPrBtn), for: .touchUpInside)
        adminPrBtn.isHidden = true
        
        adminChatBtnArray.append(adminPrBtn)
        
        bgView.insertSubview(adminPrBtn, at: 2)
        
        adminMcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        adminMcBtn.setImage(UIImage(named: "iconChatMc"), for: .normal)
        adminMcBtn.tag = AdminChatType.mc.rawValue
        adminMcBtn.addTarget(self, action: #selector(tapadminMcBtn), for: .touchUpInside)
        adminMcBtn.isHidden = true
        
        adminChatBtnArray.append(adminMcBtn)
        
        bgView.insertSubview(adminMcBtn, at: 3)
        
        self.view.addSubview(bgView)
        
        self.adminChatType = .normal
    }
    
    @objc func tapadminNormalBtn(sender: UIButton) {
        print("tap adminNormalBtn")
        self.adminChatType = .notice
    }
    
    @objc func tapadminNoticeBtn(sender: UIButton) {
        print("tap adminNoticeBtn")
        self.adminChatType = .pr
    }
    
    @objc func tapadminPrBtn(sender: UIButton) {
        print("tap adminPrBtn")
        self.adminChatType = .mc
    }
    
    @objc func tapadminMcBtn(sender: UIButton) {
        print("tap adminMcBtn")
        self.adminChatType = .normal
    }
}


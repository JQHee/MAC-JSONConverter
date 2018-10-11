//
//  MainWindowController.swift
//  JSONConverter
//
//  Created by 姚巍 on 2018/1/27.
//  Copyright © 2018年 姚巍. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    lazy var mainViewController: MainViewController = {
        let mainVc = MainViewController()
        return mainVc
    }()

    override func windowDidLoad() {
        super.windowDidLoad()
        contentViewController = mainViewController
    }
    override var windowNibName: NSNib.Name? {
        #if swift(>=4.2)
        return NSNib.Name.init("MainWindowController")
        #elseif swift(>=4.0)
        return NSNib.Name(rawValue: "MainWindowController")
        #else
        return NSNib.Name.init("MainWindowController")
        #endif
    }
}

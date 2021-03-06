//
//  ViewLoading.swift
//  PlaylistParser
//
//  Created by Zachary Whitten on 1/9/16.
//  Copyright © 2016 Zachary Whitten. All rights reserved.
//

import Foundation
import Cocoa

class ViewLoading: NSObject{
    
    var mainWindow = NSWindow()
    
    override init() {
        super.init()
    }
    
    init(aWindow: NSWindow) {
        mainWindow = aWindow
    }
    
    func makeDisabled(){
        var subviews = mainWindow.contentView?.subviews
        let count = subviews?.count
        
        for _ in 0...count!-1{
            let item = subviews?.popLast()
            if(item!.isKindOfClass(NSButton)){
                (item as! NSButton).enabled = false
            }
            if(item!.isKindOfClass(NSProgressIndicator)){
                (item as! NSProgressIndicator).startAnimation(self)
            }
        }
    }
    
    func makeEnabled(){
        var subviews = mainWindow.contentView?.subviews
        let count = subviews?.count
        
        for _ in 0...count!-1{
            let item = subviews?.popLast()
            if(item!.isKindOfClass(NSButton)){
                (item as! NSButton).enabled = true
            }
            if(item!.isKindOfClass(NSProgressIndicator)){
                (item as! NSProgressIndicator).stopAnimation(self)
            }
        }
    }
}
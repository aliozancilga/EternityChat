//
//  Message.swift
//  EternityChat
//
//  Created by Macbook on 10.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import Foundation

class Message: NSObject {
    
     @objc var fromId: String?
     @objc var text: String?
     @objc var toId: String?
     @objc var timestamp: NSNumber?
}

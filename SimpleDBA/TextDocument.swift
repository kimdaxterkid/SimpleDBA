//
//  Document.swift
//  SimpleDBA
//
//  Created by Taiwen Jin on 11/8/17.
//  Copyright © 2017 Taiwen Jin. All rights reserved.
//

import UIKit

class TextDocument: UIDocument {
    
    var userText: String? = "Default Text"
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        if let content = userText {
            let length = content.lengthOfBytes(using: String.Encoding.utf8)
//            return NSData(bytes:content, length: length)
            return Data(bytes: content, count: length)
        } else {
            return Data()
        }
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
        if let userContent = contents as? Data {
            userText = NSString(bytes: (contents as AnyObject).bytes,
                                length: userContent.count,
                                encoding: String.Encoding.utf8.rawValue) as String?
        }
    }
}


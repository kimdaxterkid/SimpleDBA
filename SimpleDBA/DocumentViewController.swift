//
//  DocumentViewController.swift
//  SimpleDBA
//
//  Created by Taiwen Jin on 11/8/17.
//  Copyright © 2017 Taiwen Jin. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {
    
    @IBOutlet weak var documentNameLabel: UILabel!
    
    @IBOutlet var textView: UITextView!
    
    var document: TextDocument?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }
    
    @IBAction func dismissDocumentViewController() {
        self.document?.userText = self.textView.text
        self.document?.save(to: self.document!.fileURL, for: UIDocumentSaveOperation.forOverwriting, completionHandler: { (success) in
            if (success) {
                print("Success")
            } else {
                print("Fail")
            }
        })
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
}

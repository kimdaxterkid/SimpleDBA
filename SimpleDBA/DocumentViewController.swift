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
                self.textView.text = self.document?.userText
                print("Open document uccessfully.")
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
                print("Fail to open the file.")
            }
        })
    }
    
    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.document?.userText = self.textView.text
            self.document?.save(to: self.document!.fileURL, for: UIDocumentSaveOperation.forOverwriting, completionHandler: { (success) in
                if (success) {
                    print("The document is saved successfully.")
                } else {
                    print("Fail to save the file.")
                }
            })
            self.document?.close(completionHandler: nil)
        }
    }
}

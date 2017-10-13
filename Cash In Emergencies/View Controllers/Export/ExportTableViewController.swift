//
//  ExportTableViewController.swift
//  Cash In Emergencies
//
//  Created by Matthew Cheetham on 13/10/2017.
//  Copyright © 2017 3 SIDED CUBE. All rights reserved.
//

import UIKit
import ThunderBasics

class ExportTableViewController: UITableViewController {

    var documentcontroller: UIDocumentInteractionController?
    
    @IBAction func handleExportCriticalPath(_ sender: UIButton) {
        
        MDCHUDActivityView.start(in: view.window, text: "Exporting")
        
        if let criticalPathFile = CSVManager.exportModules(criticalOnly: true) {
         
            documentcontroller = UIDocumentInteractionController(url: criticalPathFile)
            documentcontroller?.presentOptionsMenu(from: sender.frame, in: view, animated: true)
            MDCHUDActivityView.finish(in: view.window)
        }
    }
    
    @IBAction func handleExportEntireProgress(_ sender: UIButton) {
        
        MDCHUDActivityView.start(in: view.window, text: "Exporting")

        if let criticalPathFile = CSVManager.exportModules(criticalOnly: false) {
            
            documentcontroller = UIDocumentInteractionController(url: criticalPathFile)
            documentcontroller?.presentOptionsMenu(from: sender.frame, in: view, animated: true)
            MDCHUDActivityView.finish(in: view.window)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

//extension ExportTableViewController: UIDocumentInteractionControllerDelegate {
//
//    func documentInteractionController(_ controller: UIDocumentInteractionController, willBeginSendingToApplication application: String?) {
//
//    }
//
//    func documentInteractionController(_ controller: UIDocumentInteractionController, didEndSendingToApplication application: String?) {
//
//    }
//}

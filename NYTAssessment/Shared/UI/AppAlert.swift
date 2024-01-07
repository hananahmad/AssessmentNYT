//
//  AppAlert.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit

final class AppAlert {
    static func createOkDialog(with title: String?, message: String?) -> UIAlertController {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         // Add OK button to a dialog message
         dialogMessage.addAction(ok)
         
         return dialogMessage
    }
}

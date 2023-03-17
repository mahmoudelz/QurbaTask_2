//
//  UIApplication.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 13/03/2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

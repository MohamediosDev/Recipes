//
//  ToastManager.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import Foundation
import Toast


class ToastManager {
    
    static let shared = ToastManager()
    
    private init() {}
    
    func showToast(_ message: String) {
        let toast = Toast.text(message)
        toast.show()
    }
}

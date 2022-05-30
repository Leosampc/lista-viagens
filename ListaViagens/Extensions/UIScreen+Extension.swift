//
//  UIScreen+Extension.swift
//  ListaViagens
//
//  Created by Leonardo Cruz on 25/05/22.
//

import UIKit

extension UIScreen {
    class var isIphoneXOrBigger: Bool {
        // 812.0 on iPhone X, XS.
        // 896.0 on iPhone XS Max, XR.
        return UIScreen.main.bounds.height >= 812
    }
}

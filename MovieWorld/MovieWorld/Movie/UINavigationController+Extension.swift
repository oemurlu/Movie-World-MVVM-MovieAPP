//
//  UINavigationController+Extension.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 20.03.2023.
//

import UIKit

extension UINavigationController {
    func push(vc : UIViewController, completion: @escaping() -> () ) {
        pushViewController(vc, animated: true)
        completion()
    }
}

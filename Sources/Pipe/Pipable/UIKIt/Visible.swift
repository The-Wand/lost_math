//
//  Visible.swift
//  Heap
//
//  Created by Alexander Kozin on 19.06.16.
//  Copyright © Tradernet All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension UIViewController {

    @objc
    var visible: UIViewController {
        presentedViewController ?? self
    }

    var container: UIViewController? {
        tabBarController ?? navigationController ?? splitViewController
    }

    var isRoot: Bool {
        UIApplication.shared.visibleWindow?.rootViewController == self
    }
    
    func presentOnVisible(animated: Bool = true, completion: (() -> Void)? = nil) {
        UIApplication.shared.visibleViewController?.present(self,
                                                            animated: animated,
                                                            completion: completion)
    }

}

extension UINavigationController {

    @objc
    override var visible: UIViewController {
        visibleViewController?.visible ?? self
    }

}

extension UITabBarController {

    @objc
    override var visible: UIViewController {
        selectedViewController?.visible ?? self
    }

}

extension UIApplication {

    var visibleViewController: UIViewController? {
        visibleWindow?.rootViewController?.visible
    }

    var rootViewController: UIViewController? {
        visibleWindow?.rootViewController
    }

    var visibleWindow: UIWindow? {
        if #available(iOS 13, *) {

            let scene = UIApplication.shared.connectedScenes.first {
                ($0 as? UIWindowScene)?.activationState == .foregroundActive
            } as? UIWindowScene

            return scene?.windows.first(where: \.isKeyWindow)
        } else {
            return keyWindow
        }
    }

}
#endif

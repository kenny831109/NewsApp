//
//  SceneDelegate.swift
//  NewsApp
//
//  Created by 逸唐陳 on 2021/9/25.
//

import UIKit
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        realmConfig()
        setupAppDelegate(scene: scene)
    }
    
    func setupAppDelegate(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        let vc = ArticleViewController()
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    func realmConfig() {
        let config = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
            })
        Realm.Configuration.defaultConfiguration = config
    }
    
}


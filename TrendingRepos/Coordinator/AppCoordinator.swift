//
//  AppCoordinator.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 20/06/2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    private let navigationController: UINavigationController
    private let factory: Factory
    
    private var window: UIWindow? {
        get {
            AppDelegate.shared.window
        }
        set {
            AppDelegate.shared.window = newValue
        }
    }
    
    // MARK: - Initializer
    init(factory: Factory = DependencyFactory(), navigationController: UINavigationController = .init()) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    // MARK: - EntryPoint
    func start() {
        setupMainWindow()
        navigateToRootViewController()
    }
}

// MARK: - Helpers
private extension AppCoordinator {
    func setupMainWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
    }
    
    func navigateToRootViewController() {
        let viewController = factory.createRepositoriesView()
        navigationController.viewControllers = [viewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

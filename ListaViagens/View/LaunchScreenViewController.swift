//
//  LaunchScreenViewController.swift
//  ListaViagens
//
//  Created by Leonardo Cruz on 25/05/22.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var listaViagensLabel: UILabel!
    @IBOutlet weak var listaViagensTopConstraint: NSLayoutConstraint!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animaLabel()
    }
    
    // MARK: - Métodos
    
    func animaLabel() {
        listaViagensTopConstraint.constant = 350
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.navegaParaHome()
        })
    }
    
    func navegaParaHome() {
        let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController")
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }

}

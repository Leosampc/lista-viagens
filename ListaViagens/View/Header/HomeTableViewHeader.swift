//
//  HomeTableViewHeader.swift
//  ListaViagens
//
//  Created by Leonardo Cruz on 18/05/22.
//

import UIKit

class HomeTableViewHeader: UIView {
    
    // MARK: IBOutlets

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    func configuraView() {
        headerView.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
        headerView.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 500 : 200
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        bannerView.layer.cornerRadius = 10
        bannerView.layer.masksToBounds = true
    }
}

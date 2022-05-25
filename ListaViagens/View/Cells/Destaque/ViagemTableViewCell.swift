//
//  ViagemTableViewCell.swift
//  ListaViagens
//
//  Created by Leonardo Cruz on 19/05/22.
//

import UIKit

class ViagemTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var subtituloLabel: UILabel!
    @IBOutlet weak var diariasLabel: UILabel!
    @IBOutlet weak var precoTotalLabel: UILabel!
    @IBOutlet weak var precoDescontoLabel: UILabel!
    @IBOutlet weak var statusCancelamentoLabel: UILabel!
    
    func configuraCelula(_ viagem: Viagem?) {
        viagemImage.image = UIImage(named: viagem?.asset ?? "")
        tituloLabel.text = viagem?.titulo
        subtituloLabel.text = viagem?.subtitulo
        
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Hóspede" : "Hóspedes"
            diariasLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes)"
        }
        
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        precoTotalLabel.attributedText = atributoString
        
        precoDescontoLabel.text = "R$ \(viagem?.preco ?? 0)"
        
        DispatchQueue.main.async {
            self.backgroundViewCell.addSombra()
        }
    }
}

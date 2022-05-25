//
//  DetalheViewController.swift
//  ListaViagens
//
//  Created by Leonardo Cruz on 24/05/22.
//

import UIKit

class DetalheViewController: UIViewController {
    
    // MARK: Atributos
    
    var viagem: Viagem?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var diariasLabel: UILabel!
    @IBOutlet weak var precoTotalLabel: UILabel!
    @IBOutlet weak var precoDescontoLabel: UILabel!
    

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
    }
    
    // MARK: - IBActions

    @IBAction func botaoVoltar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Métodos
    
    class func instanciar(_ viagem: Viagem) -> DetalheViewController {
        let controller = DetalheViewController(nibName: String(describing: self), bundle: nil)
        controller.viagem = viagem
        return controller
    }
    
    func configuraView() {
        viagemImage.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Hóspede" : "Hóspedes"
            diariasLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes)"
        }
        
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        precoTotalLabel.attributedText = atributoString
        
        precoDescontoLabel.text = "R$ \(viagem?.preco ?? 0)"
    }
}

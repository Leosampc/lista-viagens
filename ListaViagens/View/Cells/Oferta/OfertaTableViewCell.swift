//
//  OfertaTableViewCell.swift
//  ListaViagens
//
//  Created by Leonardo Cruz on 20/05/22.
//

import UIKit

protocol OfertaTableViewCellDelegate {
    func selecionaView(_ viagem: Viagem?)
}

class OfertaTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet var backgroundViews: [UIView]!
    @IBOutlet var ofertaImages: [UIImageView]!
    @IBOutlet var tituloLabels: [UILabel]!
    @IBOutlet var subtituloLabels: [UILabel]!
    @IBOutlet var precoTotalLabels: [UILabel]!
    @IBOutlet var precoDescontoLabels: [UILabel]!
    
    var delegate: OfertaTableViewCellDelegate?
    private var viagens: [Viagem]?
    
    func configuraCelula(_ viagens: [Viagem]?) {
        self.viagens = viagens
        guard let listaDeViagens = viagens else { return }
        
        for i in 0..<listaDeViagens.count {
            setOutlets(i, viagem: listaDeViagens[i])
        }
        
        backgroundViews.forEach { viewAtual in
            viewAtual.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selecionaView(_:))))
            viewAtual.addSombra()
        }
    }
    
    @objc func selecionaView(_ gesture: UIGestureRecognizer) {
        if let view = gesture.view {
            let viagem = viagens?[view.tag]
            delegate?.selecionaView(viagem)
        }
    }
    
    func setOutlets(_ index: Int, viagem: Viagem) {
        let imageOutlet = ofertaImages[index]
        imageOutlet.image = UIImage(named: viagem.asset)
        
        let tituloOutlet = tituloLabels[index]
        tituloOutlet.text = viagem.titulo
        
        let subtituloOutlet = subtituloLabels[index]
        subtituloOutlet.text = viagem.subtitulo
        
        let precoTotalOutlet = precoTotalLabels[index]
        precoTotalOutlet.text = "A partir de R$ \(viagem.precoSemDesconto)"
        
        let precoDescontoOutlet = precoDescontoLabels[index]
        precoDescontoOutlet.text = "R$ \(viagem.preco)"
    }
}

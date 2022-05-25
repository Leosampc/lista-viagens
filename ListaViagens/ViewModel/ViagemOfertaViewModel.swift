//
//  ViagemOfertaViewModel.swift
//  ListaViagens
//
//  Created by Leonardo Cruz on 20/05/22.
//

import Foundation

class ViagemOfertaViewModel: ViagemViewModel {
    
    var titulo: String {
        return "Ofertas"
    }
    
    var tipo: ViagemViewModelType {
        .ofertas
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return 1
    }
    
    // MARK: - Init
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
}

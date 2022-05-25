//
//  ViagemDestaqueViewModel.swift
//  ListaViagens
//
//  Created by Leonardo Cruz on 19/05/22.
//

import Foundation

class ViagemDestaqueViewModel: ViagemViewModel {
    
    var titulo: String {
        return "Destaques"
    }
    
    var tipo: ViagemViewModelType {
        return .destaques
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        viagens.count
    }
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
}

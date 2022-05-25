//
//  TiposDeViagens.swift
//  ListaViagens
//
//  Created by Leonardo Cruz on 18/05/22.
//

import Foundation

struct TiposDeViagens: Codable {
    
    var destaques: [Viagem]?
    var ofertas: [Viagem]?
    var internacionais: [Viagem]?
    
    static func jsonToData(_ json:[String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    }

    static func decodeJson(_ jsonData: Data) -> TiposDeViagens? {
        do {
            return try JSONDecoder().decode(TiposDeViagens.self, from: jsonData)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

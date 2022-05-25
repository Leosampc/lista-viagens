//
//  ViewController.swift
//  ListaViagens
//
//  Created by Leonardo Cruz on 18/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viagensTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
        configuraTableView()
    }
    
    func configuraTableView() {
        // viagensTableView.contentInsetAdjustmentBehavior = .never
        viagensTableView.sectionHeaderTopPadding = 0
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
        
        let viagemTableViewCellNib = UINib(nibName: "ViagemTableViewCell", bundle: nil)
        let ofertaTableViewCellNib = UINib(nibName: "OfertaTableViewCell", bundle: nil)
        viagensTableView.register(viagemTableViewCellNib, forCellReuseIdentifier: "ViagemTableViewCell")
        viagensTableView.register(ofertaTableViewCellNib, forCellReuseIdentifier: "OfertaTableViewCell")
    }
    
    func irParaDetalhes(_ viagem: Viagem?) {
        if let viagem = viagem {
            let detalheViewController = DetalheViewController.instanciar(viagem)
            navigationController?.pushViewController(detalheViewController, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessaoDeViagens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = sessaoDeViagens?[indexPath.section]
        switch viewModel?.tipo {
        case .destaques:
            let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as! ViagemTableViewCell
            celulaViagem.configuraCelula(viewModel?.viagens[indexPath.row])
            return celulaViagem
        case .ofertas:
            let celulaOferta = tableView.dequeueReusableCell(withIdentifier: "OfertaTableViewCell") as! OfertaTableViewCell
            celulaOferta.delegate = self
            celulaOferta.configuraCelula(viewModel?.viagens)
            return celulaOferta
        default:
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques, .internacionais:
            let viagemSelecionada = viewModel?.viagens[indexPath.row]
            irParaDetalhes(viagemSelecionada)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: nil)?.first as! HomeTableViewHeader
            headerView.configuraView()
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 300 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 410 : 485
    }
}

extension ViewController: OfertaTableViewCellDelegate {
    
    func selecionaView(_ viagem: Viagem?) {
        irParaDetalhes(viagem)
    }
}

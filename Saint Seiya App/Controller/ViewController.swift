//
//  ViewController.swift
//  Saint Seiya App
//
//  Created by Marcelo Garcia on 18/02/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    let identifierCell = "SeiyaTableViewCell"
    let detailSegue = "detailSegue"
    var seiyaObjectSelected = SeiyaModel(imagePath: "", name: "", constellation: "", category: "", categoryImagePath: "")
    
    let seiyaArray = [
        SeiyaModel(imagePath: "seiya", name: "Seiya", constellation: "Cavaleiro de Pégaso", category: "Bronze", categoryImagePath: "bronze"),
        SeiyaModel(imagePath: "shiriyu", name: "Shiriyu", constellation: "Cavaleiro de Dragão", category: "Bronze", categoryImagePath: "bronze"),
        SeiyaModel(imagePath: "shun", name: "Shun", constellation: "Cavaleiro de Andromeda", category: "Bronze", categoryImagePath: "bronze"),
        SeiyaModel(imagePath: "hyoga", name: "Hyoga", constellation: "Cavaleiro de Cisne", category: "Bronze", categoryImagePath: "bronze"),
        SeiyaModel(imagePath: "ikki", name: "Ikki", constellation: "Cavaleiro de Fênix", category: "Bronze", categoryImagePath: "bronze"),
        SeiyaModel(imagePath: "mu", name: "Mu", constellation: "Cavaleiro de Aries", category: "Ouro", categoryImagePath: "gold-medal"),
    ]
    
    // MARK: LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: PRIVATE FUNCTIONS
    fileprivate func setupTableView(){
        // Instanciando o delegate e o dataSource.
        tableView.delegate = self
        tableView.dataSource = self
        
        // Registrar a customCell na nossa tableView
        let nib = UINib(nibName: identifierCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifierCell)
    }
    
    // Passando por parametro os valores
    // MARK: NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == detailSegue) {
            let vc = segue.destination as? DetailViewController
            vc?.seiyaObject = seiyaObjectSelected
        }
    }
}

// MARK: TABLEVIEW DELEGATE METHODS
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Navega para a outra ViewController
        seiyaObjectSelected = seiyaArray[indexPath.row]
        
        performSegue(withIdentifier: detailSegue, sender: self)
    }
}

// MARK: TABLEVIEW DATASOURCE METHODS
extension ViewController: UITableViewDataSource {
    // Define a quantidade de itens que vamos mostrar na table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seiyaArray.count
    }
    
    // Popula a tela
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell) as? SeiyaTableViewCell else {
            return UITableViewCell()
        }
        
        let seiyaObjectAtIndex = seiyaArray[indexPath.row]
        
        cell.seiyaImageView.image = UIImage(named: seiyaObjectAtIndex.imagePath)
        cell.seiyaCategoryImageView.image = UIImage(named: seiyaObjectAtIndex.categoryImagePath)
        
        cell.seiyaTitleLabel.text = seiyaObjectAtIndex.name
        cell.seiyaSubTitleLabel.text = seiyaObjectAtIndex.constellation
        cell.seiyaCategoryLabel.text = seiyaObjectAtIndex.category
        
        return cell
    }
    
    
}


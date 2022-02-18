//
//  PhotoViewController.swift
//  Saint Seiya App
//
//  Created by Marcelo Garcia on 18/02/22.
//

import UIKit

class PhotoViewController: UIViewController {
    
    // MARK: VARIABLES
    var seiyaObject: SeiyaModel = SeiyaModel(imagePath: "", name: "", constellation: "", category: "", categoryImagePath: "")

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    // MARK: LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: seiyaObject.imagePath)
        titleLabel.text = "\(seiyaObject.name) é um cavaleiro de qual tipo?"
        // Do any additional setup after loading the view.
    }
    
    // MARK: ACTIONS
    @IBAction func didSelectAnswerButton(_ sender: UIButton) {
        let answer = textField.text?.lowercased()
        let typeSeiya = seiyaObject.category.lowercased()
        
        if(answer ==  typeSeiya) {
            showAlert(title: "Boa", message: "Vc acertou, sabe tudo de cavaleiros")
        } else {
            showAlert(title: "Ops", message: "Vc errou, é um burro da porra!")
        }
    }
    
    func showAlert(title:String, message: String) {
        let alertController = UIAlertController.init(title: title, message:message , preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "Ok", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

}

//
//  DetailViewController.swift
//  Saint Seiya App
//
//  Created by Marcelo Garcia on 18/02/22.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: OUTLETS
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: VARIABLES
    var seiyaObject: SeiyaModel = SeiyaModel(imagePath: "", name: "", constellation: "", category: "", categoryImagePath: "")
    
    let photoSegue = "photoSegue"
    
    // MARK: LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: seiyaObject.imagePath)
        titleLabel.text = seiyaObject.name
        descriptionLabel.text = seiyaObject.constellation

    }
    // MARK: ACTIONS
    @IBAction func didSelectPhotoButton(_ sender: Any) {
        performSegue(withIdentifier: photoSegue, sender: self)
    }
    

    // MARK: NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == photoSegue) {
            let vc = segue.destination as? PhotoViewController
            vc?.seiyaObject = seiyaObject
        }
    }
}

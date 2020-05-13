//
//  secondViewController.swift
//  movielist
//
//  Created by Ayana on 09/05/20.
//  Copyright © 2020 Ayana. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    var name1 : String = ""
    var img2 : String = ""
    var overvw: String = ""
    var imdb1 : String = ""

    @IBOutlet weak var titlescnd: UILabel!
    @IBOutlet weak var overviewtxt: UITextView!
    
    @IBOutlet weak var scndimg: UIImageView!
    @IBOutlet weak var imdbid: UILabel!
    //  @IBOutlet weak var titlescnd: UILabel!
    @IBAction func credits(_ sender: Any) {
        
        let vcc = self.storyboard?.instantiateViewController(withIdentifier: "thirdvc") as! thirdViewController
        vcc.creditdata = imdb1
        self.navigationController?.pushViewController(vcc, animated: true)
    }
    // @IBOutlet weak var type: UILabel!
   // @IBOutlet weak var imdbid: UILabel!
//    @IBOutlet weak var title: UILabel!
//    @IBOutlet weak var type1: UILabel!
    // @IBOutlet weak var secndimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(name1)
        titlescnd.text = name1
        imdbid.text = imdb1
        overviewtxt.text = overvw
       // scndimg.image = UIImage(named: img2)
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

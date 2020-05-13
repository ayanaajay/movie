//
//  thirdViewController.swift
//  movielist
//
//  Created by Ayana on 13/05/20.
//  Copyright © 2020 Ayana. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
   @IBOutlet weak var secondtabeleview: UITableView!
    
 //   @IBOutlet weak var creditlabel: UILabel!
    let linkk = Link()
    let vm = viewmodel()
    weak var vc : ViewController?
    var arrdata1 = [Films]()
    var creditdata : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
getcreditdata()
     print( creditdata)
        // Do any additional setup after loading the view.
    }
    func getcreditdata()
    {
        let urlString = linkk.creditdomain
        print(urlString)
        let url = URL(string: urlString)
        //print(url)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                let cast = json["cast"]
            print(json)
                for arr in cast.arrayValue{
                    //print(arr["cast_id"])
                    self.arrdata1.append(Films(json: arr))
                    
                }
                DispatchQueue.main.async {
                    self.secondtabeleview.reloadData()
                }
                
            }catch{
                print(error.localizedDescription)
            }
            }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata1.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let secondcell = secondtabeleview.dequeueReusableCell(withIdentifier: "secondcell") as! secndTableViewCell
       secondcell.creditlabel.text = arrdata1[indexPath.row].name
       // secondcell.creditlabel.text = "gjgf"
       // print(arrdata1[indexPath.row].credit_id)
        let imgUrll = arrdata1[indexPath.item].profile_path
       // print(imgUrll)
        let baseUrll = "https://image.tmdb.org/t/p/w500"
        let fulurll = baseUrll + imgUrll
        let url = URL(string: fulurll)
        //print(fulurll)
        let data = try? Data(contentsOf: url!)
        secondcell.profileimg.image = UIImage(data: data!)
    
        return secondcell
    }
    
}

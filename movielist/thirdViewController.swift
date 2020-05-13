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
                    print(arr["cast_id"])
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let secondcell = secondtabeleview.dequeueReusableCell(withIdentifier: "secondcell") as! secndTableViewCell
       secondcell.creditlabel.text = arrdata1[indexPath.row].cast_id
       // secondcell.creditlabel.text = "gjgf"
        print(arrdata1[indexPath.row].cast_id)
        let imgUrl = arrdata1[indexPath.row].profile_path
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let fulurl = baseUrl + imgUrl
        let url = URL(string: fulurl)
        let data = try? Data(contentsOf: url!)
        secondcell.profileimg.image = UIImage(data: data!)
        return secondcell
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

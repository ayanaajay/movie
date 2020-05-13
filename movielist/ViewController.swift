//
//  ViewController.swift
//  movielist
//
//  Created by Ayana on 08/05/20.
//  Copyright © 2020 Ayana. All rights reserved.
//

import UIKit
class ViewController:UIViewController, UITableViewDataSource,UITableViewDelegate {
   
    let vm = viewmodel()
    //let api = API()
    var arrdata = [Films]()
    let link = Link()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableview.register(nibName, forCellReuseIdentifier: "cell")
        getdata()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func getdata()
    {
        let urlString = link.domain
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                let results = json["results"]
                 //print(json)
                for arr in results.arrayValue{
                   // print(arr["id"])
                   self.arrdata.append(Films(json: arr))

                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.namelabel.text = arrdata[indexPath.item].title
        //cell.namelabel.text = "hgh"
       // cell.yearlabel.text = arrdata[indexPath.item].id
        let imgUrl = arrdata[indexPath.row].poster_path
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let fulurl = baseUrl + imgUrl
        let url = URL(string: fulurl)
        let data = try? Data(contentsOf: url!)
        cell.imagee.image = UIImage(data: data!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let second = self.storyboard?.instantiateViewController(withIdentifier: "secondvc") as! secondViewController
      second.overvw = arrdata[indexPath.row].overview
        second.name1 = arrdata[indexPath.row].title
        second.imdb1 = arrdata[indexPath.row].id
        // self.present(third, animated: true, completion: nil)
        self.navigationController?.pushViewController(second, animated: true)
    }
}


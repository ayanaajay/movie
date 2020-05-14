//
//  similarmovieViewController.swift
//  movielist
//
//  Created by Ayana on 14/05/20.
//  Copyright © 2020 Ayana. All rights reserved.
//

import UIKit

class similarmovieViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var arrsimilardata = [Review]()
    let linkk = Link()

    @IBOutlet weak var reviewtableview: UITableView!
    @IBOutlet weak var similarmovietableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
getsimilarmovie()
       getreview()
        // Do any additional setup after loading the view.
    }
    func getsimilarmovie()
    {
        let urlString = linkk.similardomain
        //print(urlString)
        let url = URL(string: urlString)
        //print(url)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                let results = json["results"]
              // print(json)
                for arr in results.arrayValue{
                   // print(arr["title"])
                    self.arrsimilardata.append(Review(json: arr))
                    
                }
                DispatchQueue.main.async {
                    self.similarmovietableview.reloadData()
                }
                
            }catch{
                print(error.localizedDescription)
            }
            }.resume()
    }
    func getreview()
    {
        let urlString = linkk.reviewdomain
        print(urlString)
        let url = URL(string: urlString)
        //print(url)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                let res = json["results"]
                print(json)
                for arr in res.arrayValue{
                //print(arr["author"])
                    self.arrsimilardata.append(Review(json: arr))
                    
                }
                DispatchQueue.main.async {
                    self.reviewtableview.reloadData()
                }
                
            }catch{
                print(error.localizedDescription)
            }
            }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrsimilardata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == similarmovietableview{
        //{
        let similarmoviecell = similarmovietableview.dequeueReusableCell(withIdentifier: "similarmoviecell", for: indexPath) as! similarmovieTableViewCell
       similarmoviecell.titlelabel.text = arrsimilardata[indexPath.row].title
       
        let imgUrll = arrsimilardata[indexPath.item].poster_path
        let baseUrll = "https://image.tmdb.org/t/p/w500"
        let fulurll = baseUrll + imgUrll
        let url = URL(string: fulurll)
        let data = try? Data(contentsOf: url!)
        similarmoviecell.posterimg.image = UIImage(data: data!)
        return similarmoviecell
        }
        else
        {

        let reviewcell = reviewtableview.dequeueReusableCell(withIdentifier: "reviewcell", for: indexPath) as! reviewTableViewCell
       reviewcell.authorlabel.text = arrsimilardata[indexPath.row].id
            
       //print(arrsimilardata[indexPath.row].content)
           // reviewcell.authorlabel.text = "hi"
        reviewcell.contenttxt.text = arrsimilardata[indexPath.row].content
        return reviewcell
    }
   }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}

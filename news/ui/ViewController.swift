//
//  ViewController.swift
//  news
//
//  Created by Айдар Чакиев on 27/1/21.
//

import UIKit
import Kingfisher

class ViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, NewsView {
    @IBOutlet weak var newsTable: UITableView!
    
    var service: NewsService!

    var listData: [NewsMainModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service = NewsService(delegate: self)
        self.newsTable.delegate = self
        self.newsTable.dataSource = self
        self.newsTable.separatorStyle = .none
        self.registerTable()
        getNews()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = newsTable.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell{
            cell.newsTitle.text = listData[indexPath.row].title
            
            let url = URL(string: listData[indexPath.row].urlToImage!)
            cell.newsImage.kf.setImage(with: url)
            
            cell.newsDetailText.text = listData[indexPath.row].description
            cell.newsDate.text = listData[indexPath.row].publishedAt
        
            
            return cell
        }
        
        return UITableViewCell()

        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(listData[indexPath.row].url)")
        let vc = getVC(name: "WebView") as! WebView
        vc.urlNews = listData[indexPath.row].url!
        self.navigationController?.pushViewController(vc, animated:true)
        
    }
    
    func registerTable(){
        let rowCell = UINib(nibName: "NewsCell", bundle: nil)
        self.newsTable.register(rowCell, forCellReuseIdentifier: "NewsCell")
    }
    
    
    func getNews(){
        service.getNews{
            [self]
            (response) in
            listData.removeAll()
            listData.append(contentsOf: response)
            newsTable.reloadData()
        }
    }


}


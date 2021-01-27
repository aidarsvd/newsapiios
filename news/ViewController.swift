//
//  ViewController.swift
//  news
//
//  Created by Айдар Чакиев on 27/1/21.
//

import UIKit

class ViewController: UIViewController, NewsView {
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func error(error: String) {
        
    }
    
    var service: NewsService!

    var listData: [NewsMainModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service = NewsService(delegate: self)
        getNews()
        
        
        // Do any additional setup after loading the view.
    }
    
    func getNews(){
        service.getNews{
            [self]
            (response) in
            listData.append(contentsOf: response)
            print(listData[0].title)
        }
    }


}


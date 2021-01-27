//
//  NewsService.swift
//  news
//
//  Created by Айдар Чакиев on 27/1/21.
//

import Foundation
import Alamofire
import ObjectMapper


protocol NewsView: BaseView {
    
}

class NewsService{
    let delegate : NewsView
    
    init(delegate: NewsView) {
        self.delegate = delegate
    }
    
    func getNews(handler: @escaping([NewsMainModel]) -> Void){
        delegate.showLoading()
        
        let url = BASE_URL
        print(url)
        let headers: HTTPHeaders = ["Content-Type":"application/json"]

        AF.request(url, method: .get, headers: headers).responseJSON{
            (response) in
            print("\n getNews ------------- \(String(describing: response.value))")
            self.delegate.hideLoading()
            
            switch(response.result){
            
            case .success(_):
                guard let mapperResponse = Mapper<BaseResponse<NewsMainModel>>().map(JSONObject: response.value) else{
                    print(response.result)
                    return
                }
                
                if mapperResponse.status != "ok" {
                    self.delegate.error(error: "Error")
                    return
                }
                
                handler(mapperResponse.articles!)
                
            case .failure(_):
                
                self.delegate.error(error: "Error")
                break
            
            }
            
        }
        
    }
    
}

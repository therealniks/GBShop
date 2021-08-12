//
//  Goods.swift
//  GBShop
//
//  Created by therealniks on 12.08.2021.
//

import Alamofire

class Goods: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseURL = URL(string: ConstantsForUrl.baseURL)!
        init( errorParser: AbstractErrorParser,
            sessionManager: Session,
            queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        }
}


extension Goods: GoodsRequestFactory {
    func getCatalog(page: Int, category: Int, completion: @escaping (AFDataResponse<[Product]>) -> Void) {
        let requestModel = CatalogData(baseUrl: baseURL, page: page, category: category)
        self.request(request: requestModel, completion: completion)
    }
    
    func getProduct(for id: Int, completion: @escaping (AFDataResponse<ProductResult>) -> Void) {
        let requestModel = ProductById(baseUrl: baseURL, id: id)
        self.request(request: requestModel, completion: completion)
    }
}

extension Goods {
    struct ProductById: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "getGoodById.json"
        let id: Int
        var parameters: Parameters? {
            return [
                "id_product": String(id)
            ]
        }
    }
    
    struct CatalogData: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        let path = "catalogData.json"
        let page: Int
        let category: Int
        var parameters: Parameters? {
                return ["page_number": String(page),
                        "id_category": String(category)
                ]

        }
    }
}

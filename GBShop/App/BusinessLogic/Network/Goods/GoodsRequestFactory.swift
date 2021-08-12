//
//  GoodsRequestFactory.swift
//  GBShop
//
//  Created by therealniks on 12.08.2021.
//

import Alamofire

protocol GoodsRequestFactory {
    func getCatalog(page: Int, category: Int, completion: @escaping (AFDataResponse<[Product]>) -> Void)
    func getProduct(for id: Int, completion: @escaping (AFDataResponse<ProductResult>) -> Void)
}

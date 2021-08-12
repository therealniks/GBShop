//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by therealniks on 01.08.2021.
//

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

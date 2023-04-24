//
//  CreditCard.swift
//  RecommendCreditCard
//
//  Created by 김건호 on 2023/04/24.
//

import Foundation

struct CreditCard: Codable{
    let id : Int
    let rank : Int
    let name : String
    let cardImageURL: String
    let promotionDetail : promotionDetail
    let isSelected: Bool?
}

struct promotionDetail: Codable {
    let companyName:String
    let amount: Int
    let period: String
    let benefitDate:String
    let benefitDetail:String
    let benefitCondition:String
    let condition:String
    
}

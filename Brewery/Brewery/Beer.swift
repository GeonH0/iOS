//
//  Beer.swift
//  Brewery
//
//  Created by 김건호 on 2023/07/28.
//

import Foundation

struct Beer : Decodable {
    let id : Int?
    let name,taglineString, description, brewersTips,imageURL : String?
    let foodPairing : [String]?
    
    var tagLine : String {
        let tags = taglineString?.components(separatedBy: ". ")// . 단위로 tag 라인을 구분한다.
        let hashtags = tags?.map {
            "#" + $0.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: " #")
        }
        return hashtags?.joined(separator: " ") ?? ""
    }
    
    
    //실제 받는 형식과 매칭
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case taglineString = "tagline"
        case imageURL = "image_url"
        case brewersTips = "brewers_tips"
        case foodPairing = "food_pairing"
    }
}

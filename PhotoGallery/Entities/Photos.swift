//
//  Photos.swift
//  PhotoGallery
//
//  Created by Kumail kashefi on 25/04/2022.
//

import Foundation

struct Photos : Codable {
	let total : Int?
	let totalHits : Int?
	let hits : [Hits]?

	enum CodingKeys: String, CodingKey {

		case total = "total"
		case totalHits = "totalHits"
		case hits = "hits"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		totalHits = try values.decodeIfPresent(Int.self, forKey: .totalHits)
		hits = try values.decodeIfPresent([Hits].self, forKey: .hits)
	}

}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postRequestResponse = try? JSONDecoder().decode(PostRequestResponse.self, from: jsonData)

import Foundation

// MARK: - PostRequestResponse
struct PostRequestResponse: Codable {
    let data: DataClass
    let message: String?
    let errorList: [String?]

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case message = "Message"
        case errorList = "ErrorList"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let totalShoppingCartProducts, totalWishListProducts: Int
    let redirectToDetailsPage, redirectToWishListPage, redirectToShoppingCartPage: Bool

    enum CodingKeys: String, CodingKey {
        case totalShoppingCartProducts = "TotalShoppingCartProducts"
        case totalWishListProducts = "TotalWishListProducts"
        case redirectToDetailsPage = "RedirectToDetailsPage"
        case redirectToWishListPage = "RedirectToWishListPage"
        case redirectToShoppingCartPage = "RedirectToShoppingCartPage"
    }
}

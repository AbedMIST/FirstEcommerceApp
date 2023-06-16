// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let featureProductResponse = try? JSONDecoder().decode(FeatureProductResponse.self, from: jsonData)

import Foundation

// MARK: - FeatureProductResponse
struct FeatureProductResponse: Codable {   //Codable used for encodable and decodable protocol
    let data: [Datum]
    let message: JSONNull?
    let errorList: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case message = "Message"
        case errorList = "ErrorList"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let name, shortDescription, fullDescription, seName: String
    let sku: String
    let productType: Int
    let markAsNew: Bool
    let productPrice: ProductPrice
    let pictureModels: [PictureModel]
    let productSpecificationModel: ProductSpecificationModel
    let reviewOverviewModel: ReviewOverviewModel
    let id: Int
    let customProperties: CustomProperties

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case shortDescription = "ShortDescription"
        case fullDescription = "FullDescription"
        case seName = "SeName"
        case sku = "Sku"
        case productType = "ProductType"
        case markAsNew = "MarkAsNew"
        case productPrice = "ProductPrice"
        case pictureModels = "PictureModels"
        case productSpecificationModel = "ProductSpecificationModel"
        case reviewOverviewModel = "ReviewOverviewModel"
        case id = "Id"
        case customProperties = "CustomProperties"
    }
}

// MARK: - CustomProperties
struct CustomProperties: Codable {
}

// MARK: - PictureModel
struct PictureModel: Codable {
    let imageURL: String
    let thumbImageURL: JSONNull?
    let fullSizeImageURL: String
    let title, alternateText: String
    let customProperties: CustomProperties

    enum CodingKeys: String, CodingKey {
        case imageURL = "ImageUrl"
        case thumbImageURL = "ThumbImageUrl"
        case fullSizeImageURL = "FullSizeImageUrl"
        case title = "Title"
        case alternateText = "AlternateText"
        case customProperties = "CustomProperties"
    }
}

// MARK: - ProductPrice
struct ProductPrice: Codable {
    let oldPrice, oldPriceValue: JSONNull?
    let price: String
    let priceValue: Int
    let basePricePAngV: JSONNull?
    let basePricePAngVValue: Int
    let disableBuyButton, disableWishlistButton, disableAddToCompareListButton, availableForPreOrder: Bool
    let preOrderAvailabilityStartDateTimeUTC: JSONNull?
    let isRental, forceRedirectionAfterAddingToCart, displayTaxShippingInfo: Bool
    let customProperties: CustomProperties

    enum CodingKeys: String, CodingKey {
        case oldPrice = "OldPrice"
        case oldPriceValue = "OldPriceValue"
        case price = "Price"
        case priceValue = "PriceValue"
        case basePricePAngV = "BasePricePAngV"
        case basePricePAngVValue = "BasePricePAngVValue"
        case disableBuyButton = "DisableBuyButton"
        case disableWishlistButton = "DisableWishlistButton"
        case disableAddToCompareListButton = "DisableAddToCompareListButton"
        case availableForPreOrder = "AvailableForPreOrder"
        case preOrderAvailabilityStartDateTimeUTC = "PreOrderAvailabilityStartDateTimeUtc"
        case isRental = "IsRental"
        case forceRedirectionAfterAddingToCart = "ForceRedirectionAfterAddingToCart"
        case displayTaxShippingInfo = "DisplayTaxShippingInfo"
        case customProperties = "CustomProperties"
    }
}

// MARK: - ProductSpecificationModel
struct ProductSpecificationModel: Codable {
    let groups: [JSONAny]
    let customProperties: CustomProperties

    enum CodingKeys: String, CodingKey {
        case groups = "Groups"
        case customProperties = "CustomProperties"
    }
}

// MARK: - ReviewOverviewModel
struct ReviewOverviewModel: Codable {
    let productID, ratingSum, totalReviews: Int
    let allowCustomerReviews, canAddNewReview: Bool
    let customProperties: CustomProperties

    enum CodingKeys: String, CodingKey {
        case productID = "ProductId"
        case ratingSum = "RatingSum"
        case totalReviews = "TotalReviews"
        case allowCustomerReviews = "AllowCustomerReviews"
        case canAddNewReview = "CanAddNewReview"
        case customProperties = "CustomProperties"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}


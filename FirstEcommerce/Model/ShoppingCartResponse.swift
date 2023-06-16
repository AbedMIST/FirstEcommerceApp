// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let shoppingCartResponse = try? JSONDecoder().decode(ShoppingCartResponse.self, from: jsonData)

import Foundation

// MARK: - ShoppingCartResponse
struct ShoppingCartResponse: Codable {
    let data: CartDataClass
    let message: String?
    let errorList: [String?]

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case message = "Message"
        case errorList = "ErrorList"
    }
}

// MARK: - DataClass
struct CartDataClass: Codable {
    let cart: Cart
    let orderTotals: OrderTotals
    let selectedCheckoutAttributes: String
    let estimateShipping: EstimateShipping
    let anonymousPermissed: Bool

    enum CodingKeys: String, CodingKey {
        case cart = "Cart"
        case orderTotals = "OrderTotals"
        case selectedCheckoutAttributes = "SelectedCheckoutAttributes"
        case estimateShipping = "EstimateShipping"
        case anonymousPermissed = "AnonymousPermissed"
    }
}

// MARK: - Cart
struct Cart: Codable {
    let onePageCheckoutEnabled, showSku, showProductImages, isEditable: Bool
    let items: [Item]
    let checkoutAttributes: [CheckoutAttribute]
    let warnings: [String?]
    let minOrderSubtotalWarning: String?
    let displayTaxShippingInfo, termsOfServiceOnShoppingCartPage, termsOfServiceOnOrderConfirmPage, termsOfServicePopup: Bool
    let discountBox: DiscountBox
    let giftCardBox: GiftCardBox
    let orderReviewData: OrderReviewData
    let buttonPaymentMethodViewComponents: [String?]
    let hideCheckoutButton, showVendorName: Bool
    let customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case onePageCheckoutEnabled = "OnePageCheckoutEnabled"
        case showSku = "ShowSku"
        case showProductImages = "ShowProductImages"
        case isEditable = "IsEditable"
        case items = "Items"
        case checkoutAttributes = "CheckoutAttributes"
        case warnings = "Warnings"
        case minOrderSubtotalWarning = "MinOrderSubtotalWarning"
        case displayTaxShippingInfo = "DisplayTaxShippingInfo"
        case termsOfServiceOnShoppingCartPage = "TermsOfServiceOnShoppingCartPage"
        case termsOfServiceOnOrderConfirmPage = "TermsOfServiceOnOrderConfirmPage"
        case termsOfServicePopup = "TermsOfServicePopup"
        case discountBox = "DiscountBox"
        case giftCardBox = "GiftCardBox"
        case orderReviewData = "OrderReviewData"
        case buttonPaymentMethodViewComponents = "ButtonPaymentMethodViewComponents"
        case hideCheckoutButton = "HideCheckoutButton"
        case showVendorName = "ShowVendorName"
        case customProperties = "CustomProperties"
    }
}

// MARK: - CheckoutAttribute
struct CheckoutAttribute: Codable {
    let name: String
    let defaultValue, textPrompt: String?
    let isRequired: Bool
    let selectedDay, selectedMonth, selectedYear: String?
    let allowedFileExtensions: [String?]
    let attributeControlType: Int
    let values: [Value]
    let id: Int
    let customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case defaultValue = "DefaultValue"
        case textPrompt = "TextPrompt"
        case isRequired = "IsRequired"
        case selectedDay = "SelectedDay"
        case selectedMonth = "SelectedMonth"
        case selectedYear = "SelectedYear"
        case allowedFileExtensions = "AllowedFileExtensions"
        case attributeControlType = "AttributeControlType"
        case values = "Values"
        case id = "Id"
        case customProperties = "CustomProperties"
    }
}

// MARK: - Custom
struct Custom: Codable {
}

// MARK: - Value
struct Value: Codable {
    let name: String
    let colorSquaresRGB: String?
    let priceAdjustment: String?
    let isPreSelected: Bool
    let id: Int
    let customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case colorSquaresRGB = "ColorSquaresRgb"
        case priceAdjustment = "PriceAdjustment"
        case isPreSelected = "IsPreSelected"
        case id = "Id"
        case customProperties = "CustomProperties"
    }
}

// MARK: - DiscountBox
struct DiscountBox: Codable {
    let appliedDiscountsWithCodes: [String?]
    let display: Bool
    let messages: [String?]
    let isApplied: Bool
    let customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case appliedDiscountsWithCodes = "AppliedDiscountsWithCodes"
        case display = "Display"
        case messages = "Messages"
        case isApplied = "IsApplied"
        case customProperties = "CustomProperties"
    }
}

// MARK: - GiftCardBox
struct GiftCardBox: Codable {
    let display: Bool
    let message: String?
    let isApplied: Bool
    let customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case display = "Display"
        case message = "Message"
        case isApplied = "IsApplied"
        case customProperties = "CustomProperties"
    }
}

// MARK: - Item
struct Item: Codable {
    let sku, vendorName: String
    let picture: Picture
    let productID: Int
    let productName, productSEName, unitPrice: String
    let unitPriceValue: Double
    let subTotal: String
    let subTotalValue: Int
    let discount: String?
    let discountValue: Int
    let maximumDiscountedQty: String?
    let quantity: Int
    let allowedQuantities: [String?]
    let attributeInfo: String
    let recurringInfo, rentalInfo: String?
    let allowItemEditing, disableRemoval: Bool
    let warnings: [String?]
    let id: Int
    let customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case sku = "Sku"
        case vendorName = "VendorName"
        case picture = "Picture"
        case productID = "ProductId"
        case productName = "ProductName"
        case productSEName = "ProductSeName"
        case unitPrice = "UnitPrice"
        case unitPriceValue = "UnitPriceValue"
        case subTotal = "SubTotal"
        case subTotalValue = "SubTotalValue"
        case discount = "Discount"
        case discountValue = "DiscountValue"
        case maximumDiscountedQty = "MaximumDiscountedQty"
        case quantity = "Quantity"
        case allowedQuantities = "AllowedQuantities"
        case attributeInfo = "AttributeInfo"
        case recurringInfo = "RecurringInfo"
        case rentalInfo = "RentalInfo"
        case allowItemEditing = "AllowItemEditing"
        case disableRemoval = "DisableRemoval"
        case warnings = "Warnings"
        case id = "Id"
        case customProperties = "CustomProperties"
    }
}

// MARK: - Picture
struct Picture: Codable {
    let imageURL: String
    let thumbImageURL, fullSizeImageURL: String?
    let title, alternateText: String
    let customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case imageURL = "ImageUrl"
        case thumbImageURL = "ThumbImageUrl"
        case fullSizeImageURL = "FullSizeImageUrl"
        case title = "Title"
        case alternateText = "AlternateText"
        case customProperties = "CustomProperties"
    }
}

// MARK: - OrderReviewData
struct OrderReviewData: Codable {
    let display: Bool
    let billingAddress: Address
    let isShippable: Bool
    let shippingAddress: Address
    let selectedPickupInStore: Bool
    let pickupAddress: Address
    let shippingMethod, paymentMethod: String?
    let customValues, customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case display = "Display"
        case billingAddress = "BillingAddress"
        case isShippable = "IsShippable"
        case shippingAddress = "ShippingAddress"
        case selectedPickupInStore = "SelectedPickupInStore"
        case pickupAddress = "PickupAddress"
        case shippingMethod = "ShippingMethod"
        case paymentMethod = "PaymentMethod"
        case customValues = "CustomValues"
        case customProperties = "CustomProperties"
    }
}

// MARK: - Address
struct Address: Codable {
    let firstName, lastName, email: String?
    let companyEnabled, companyRequired: Bool
    let company: String?
    let countryEnabled: Bool
    let countryID, countryName: String?
    let stateProvinceEnabled: Bool
    let stateProvinceID, stateProvinceName: String?
    let countyEnabled, countyRequired: Bool
    let county: String?
    let cityEnabled, cityRequired: Bool
    let city: String?
    let streetAddressEnabled, streetAddressRequired: Bool
    let address1: String?
    let streetAddress2Enabled, streetAddress2Required: Bool
    let address2: String?
    let zipPostalCodeEnabled, zipPostalCodeRequired: Bool
    let zipPostalCode: String?
    let phoneEnabled, phoneRequired: Bool
    let phoneNumber: String?
    let faxEnabled, faxRequired: Bool
    let faxNumber: String?
    let availableCountries, availableStates: [String?]
    let formattedCustomAddressAttributes: String?
    let customAddressAttributes: [String?]
    let id: Int
    let customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case firstName = "FirstName"
        case lastName = "LastName"
        case email = "Email"
        case companyEnabled = "CompanyEnabled"
        case companyRequired = "CompanyRequired"
        case company = "Company"
        case countryEnabled = "CountryEnabled"
        case countryID = "CountryId"
        case countryName = "CountryName"
        case stateProvinceEnabled = "StateProvinceEnabled"
        case stateProvinceID = "StateProvinceId"
        case stateProvinceName = "StateProvinceName"
        case countyEnabled = "CountyEnabled"
        case countyRequired = "CountyRequired"
        case county = "County"
        case cityEnabled = "CityEnabled"
        case cityRequired = "CityRequired"
        case city = "City"
        case streetAddressEnabled = "StreetAddressEnabled"
        case streetAddressRequired = "StreetAddressRequired"
        case address1 = "Address1"
        case streetAddress2Enabled = "StreetAddress2Enabled"
        case streetAddress2Required = "StreetAddress2Required"
        case address2 = "Address2"
        case zipPostalCodeEnabled = "ZipPostalCodeEnabled"
        case zipPostalCodeRequired = "ZipPostalCodeRequired"
        case zipPostalCode = "ZipPostalCode"
        case phoneEnabled = "PhoneEnabled"
        case phoneRequired = "PhoneRequired"
        case phoneNumber = "PhoneNumber"
        case faxEnabled = "FaxEnabled"
        case faxRequired = "FaxRequired"
        case faxNumber = "FaxNumber"
        case availableCountries = "AvailableCountries"
        case availableStates = "AvailableStates"
        case formattedCustomAddressAttributes = "FormattedCustomAddressAttributes"
        case customAddressAttributes = "CustomAddressAttributes"
        case id = "Id"
        case customProperties = "CustomProperties"
    }
}

// MARK: - EstimateShipping
struct EstimateShipping: Codable {
    let requestDelay: Int
    let enabled: Bool
    let countryID, stateProvinceID, zipPostalCode: String?
    let useCity: Bool
    let city: String?
    let availableCountries, availableStates: [Available]
    let customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case requestDelay = "RequestDelay"
        case enabled = "Enabled"
        case countryID = "CountryId"
        case stateProvinceID = "StateProvinceId"
        case zipPostalCode = "ZipPostalCode"
        case useCity = "UseCity"
        case city = "City"
        case availableCountries = "AvailableCountries"
        case availableStates = "AvailableStates"
        case customProperties = "CustomProperties"
    }
}

// MARK: - Available
struct Available: Codable {
    let disabled: Bool
    let group: String?
    let selected: Bool
    let text, value: String

    enum CodingKeys: String, CodingKey {
        case disabled = "Disabled"
        case group = "Group"
        case selected = "Selected"
        case text = "Text"
        case value = "Value"
    }
}

// MARK: - OrderTotals
struct OrderTotals: Codable {
    let isEditable: Bool
    let subTotal: String
    let subTotalDiscount: String?
    let shipping: String
    let requiresShipping: Bool
    let selectedShippingMethod: String?
    let hideShippingTotal: Bool
    let paymentMethodAdditionalFee: String?
    let tax: String
    let taxRates: [TaxRate]
    let displayTax, displayTaxRates: Bool
    let giftCards: [String?]
    let orderTotalDiscount: String?
    let redeemedRewardPoints: Int
    let redeemedRewardPointsAmount: String?
    let willEarnRewardPoints: Int
    let orderTotal: String
    let customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case isEditable = "IsEditable"
        case subTotal = "SubTotal"
        case subTotalDiscount = "SubTotalDiscount"
        case shipping = "Shipping"
        case requiresShipping = "RequiresShipping"
        case selectedShippingMethod = "SelectedShippingMethod"
        case hideShippingTotal = "HideShippingTotal"
        case paymentMethodAdditionalFee = "PaymentMethodAdditionalFee"
        case tax = "Tax"
        case taxRates = "TaxRates"
        case displayTax = "DisplayTax"
        case displayTaxRates = "DisplayTaxRates"
        case giftCards = "GiftCards"
        case orderTotalDiscount = "OrderTotalDiscount"
        case redeemedRewardPoints = "RedeemedRewardPoints"
        case redeemedRewardPointsAmount = "RedeemedRewardPointsAmount"
        case willEarnRewardPoints = "WillEarnRewardPoints"
        case orderTotal = "OrderTotal"
        case customProperties = "CustomProperties"
    }
}

// MARK: - TaxRate
struct TaxRate: Codable {
    let rate, value: String
    let customProperties: Custom

    enum CodingKeys: String, CodingKey {
        case rate = "Rate"
        case value = "Value"
        case customProperties = "CustomProperties"
    }
}

// MARK: - Encode/decode helpers



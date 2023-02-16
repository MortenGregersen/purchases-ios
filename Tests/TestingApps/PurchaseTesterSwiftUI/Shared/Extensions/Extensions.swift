//
//  Extensions.swift
//  PurchaseTester
//
//  Created by Nacho Soto on 10/25/22.
//

import Foundation

import RevenueCat

extension String {

    var nonEmpty: String? {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)

        return trimmed.isEmpty
            ? nil
            : trimmed
    }

}

extension EntitlementValidation: CustomStringConvertible {

    public var description: String {
        switch self {
        case .notValidated: return "Not verified"
        case .validated: return "Verified"
        case .failedValidation: return "Failed verification"
        }
    }

}

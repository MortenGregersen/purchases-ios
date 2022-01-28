//
//  Copyright RevenueCat Inc. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  NoContentResponseHandler.swift
//
//  Created by Joshua Liebowitz on 11/30/21.

import Foundation

class NoContentResponseHandler {

    func handle(maybeResponse: [String: Any]?,
                statusCode: Int,
                maybeError: Error?,
                completion: SimpleResponseHandler) {
        if let error = maybeError {
            completion(ErrorUtils.networkError(withUnderlyingError: error))
            return
        }

        guard statusCode <= HTTPStatusCodes.redirect.rawValue else {
            let backendErrorCode = BackendErrorCode(maybeCode: maybeResponse?["code"])
            let message = maybeResponse?["message"] as? String
            let responseError = ErrorUtils.backendError(withBackendCode: backendErrorCode, backendMessage: message)
            completion(responseError)
            return
        }

        completion(nil)
    }

}

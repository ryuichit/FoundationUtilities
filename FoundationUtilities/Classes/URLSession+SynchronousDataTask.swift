//
//  URLSession+SynchronousDataTask.swift
//  FoundationUtilities
//
//  Created by Ryuichi Tanimoto on 01/03/17
//  Copyright (c) 2017 Ryuichi Tanimoto. All rights reserved.
//

import Foundation

extension URLSession {
    public func synchronousDataTask(with request: URLRequest) -> (data: Data?, response: URLResponse?, error: Error?) {
        var aData: Data? = nil
        var aResponse: URLResponse? = nil
        var aError: Error? = nil
        let semaphore = DispatchSemaphore(value: 0)
        self.dataTask(with: request) {data, response, error in
            aData = data
            aResponse = response
            aError = error
            semaphore.signal()
            }.resume()
        let _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return (aData, aResponse, aError)
    }
}

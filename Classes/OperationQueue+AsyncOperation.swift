//
//  OperationQueue+AsyncOperation.swift
//  Pods-Demo
//
//  Created by Siarhei Ladzeika on 11/19/17.
//

import Foundation

extension OperationQueue {
    
    open func addAsyncOperation(job: @escaping AsyncOperationJobBlock) {
        let operation = AsyncOperation(job: job)
        addOperation(operation)
    }
    
}

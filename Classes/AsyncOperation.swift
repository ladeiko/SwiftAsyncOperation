//
//  AsyncOperation.swift
//
//  Created by Siarhei Ladzeika on 9/26/17.
//  Copyright © 2017 BPMobile. All rights reserved.
//

import Foundation

public typealias AsyncOperationCompletionBlock = () -> Void
public typealias AsyncOperationJobBlock = (_ operation: Operation, _ completion: @escaping AsyncOperationCompletionBlock) -> Void

open class AsyncOperation : Operation {
    
    private var _executing = false
    private var _finished = false
    private let _job: AsyncOperationJobBlock
    
    public init(job: @escaping AsyncOperationJobBlock) {
        self._job = job
        super.init()
    }
    
    override internal(set) open var isExecuting: Bool {
        get {
            return _executing
        }
        set {
            if _executing != newValue {
                willChangeValue(forKey: "isExecuting")
                _executing = newValue
                didChangeValue(forKey: "isExecuting")
            }
        }
    }
    
    override internal(set) open var isFinished: Bool {
        get {
            return _finished
        }
        set {
            if _finished != newValue {
                willChangeValue(forKey: "isFinished")
                _finished = newValue
                didChangeValue(forKey: "isFinished")
            }
        }
    }
    
    open override var isAsynchronous: Bool {
        return true
    }
    
    open override func start() {
        isExecuting = true
        
        _job(self) {
            self.isExecuting = false
            self.isFinished = true
        }
    }
}

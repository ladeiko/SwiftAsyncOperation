//
//  ViewController.swift
//  Demo
//
//  Created by Siarhei Ladzeika on 11/19/17.
//  Copyright © 2017 Siarhei Ladzeika. All rights reserved.
//

import UIKit
import SwiftAsyncOperation

class ViewController: UIViewController {
    
    let operationQueue = OperationQueue()
    
    @IBOutlet weak var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        operationQueue.maxConcurrentOperationCount = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let operation = AsyncOperation(job: { operation, completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.label!.text = "Done"
                completion()
            })
        })
        
        operationQueue.addOperation(operation)
        
        let canceledOperation = AsyncOperation(job: { operation, completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                if !operation.isCancelled {
                    self.label!.text = "Done 2"
                }
                completion()
            })
        })
        
        operationQueue.addOperation(canceledOperation)
        canceledOperation.cancel()
        
        operationQueue.addAsyncOperation { (operation, completion) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.label!.text = "Done 3"
                completion()
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


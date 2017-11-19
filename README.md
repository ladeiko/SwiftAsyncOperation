# SwiftAsyncOperation

OperaionQueue async operation for Swift >= 3 based on block.

It helps to run async operations with ability to be canceled.


## Installation

### Cocoapods

```ruby
pod 'SwiftAsyncOperation'
```

## Usage

### Importing

```swift
import SwiftAsyncOperation
```

### Adding operation

```swift
let operation = AsyncOperation(job: { operation, completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.label!.text = "Done"
                completion()
            })
        })
        
operationQueue.addOperation(operation)
```

or directly with block:

```swift
operationQueue.addAsyncOperation { (operation, completion) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.label!.text = "Done 3"
                completion()
            })
        }
```

### Cancelation

```swift
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
```

## LICENSE

MIT License

Copyright (c) 2017 Siarhei Ladzeika

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
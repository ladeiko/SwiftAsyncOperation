Pod::Spec.new do |s|
    s.name = 'SwiftAsyncOperation'
    s.version = '1.1.0'
    s.summary = 'OperationQueue async operation for Swift >= 3'
    s.homepage = 'https://github.com/ladeiko/SwiftAsyncOperation'
    s.license = { :type => 'CUSTOM', :file => 'LICENSE' }
    s.author = { 'Siarhei Ladzeika' => 'sergey.ladeiko@gmail.com' }
    s.platform = :ios, '9.0'
    s.source = { :git => 'https://github.com/ladeiko/SwiftAsyncOperation.git', :tag => "#{s.version}" }
    s.source_files = 'Classes/**/*.{swift}'
    s.frameworks = 'Foundation'
    s.requires_arc = true

end
# Cocoapods duplicate classes problem

## Situation

Given the following `Podfile`:

```
target "Dup" do
  pod 'ReactiveCocoa', '~> 2.3.1'
end

target "DupTests" do
  pod 'Expecta+ReactiveCocoa', '~> 0.2.0'
end
```

The main target requires `ReactiveCocoa` the tests require a pod that depends on `ReactiveCocoa`. As a result the `Pods` project includes two products for `ReactiveCocoa`: `libPods-Dup-ReactiveCocoa.a` and `libPods-DupTests-ReactiveCocoa.a`. When running the tests both are linked, the first one directly in the app, the second one dynamically with the test bundle during runtime.

## Problem

This leads to *Class schizophrenia* in when running the test:

```
    USAppDelegate *appDelegate = (USAppDelegate*)[[UIApplication sharedApplication] delegate];
    RACSubject *subject = appDelegate.subject;
    
    XCTAssertEqual(subject.class, RACSubject.class,
                   @"Expecting %@<%p> to equal %@<%p>",
                   NSStringFromClass(subject.class), subject.class,
                   NSStringFromClass(RACSubject.class), RACSubject.class);

    // error: ((subject.class) equal to (RACSubject.class))
    // failed: ("<50620a00>") is not equal to ("<a0402509>") -
    // Expecting RACSubject<0xa6250> to equal RACSubject<0x92540a0>
```

The problem is reconstructed in the this project.
//
//  Observable.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 26/06/2022.
//

final class Observable<T> {
    var listener: ((T) -> Void)?

    var value: T {
        didSet { listener?(value) }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: ((T) -> Void)?) {
        self.listener = listener
        listener?(value)
    }
}

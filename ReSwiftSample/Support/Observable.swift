//
//  Observable.swift
//  BlocksBattle
//
//  Created by Mariano Donati on 2/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

class Observable<T> {

    typealias Handler = (T, T) -> Void
    private typealias Subscription = (object: AnyObject, handler: Handler)
    
    private var subscriptions = [Subscription]()
    private var muted = false
    
    var value: T {
        didSet {
            if !self.muted {
                self.subscriptions.forEach { (subscription) in
                    subscription.handler(oldValue, self.value)
                }
            }
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func subscribe(_ subscriber: AnyObject, handler: @escaping Handler) {
        let subscription = Subscription(object: subscriber, handler: handler)
        if let index = self.indexOfSubscriber(subscriber) {
            self.subscriptions[index] = subscription
        } else {
            self.subscriptions.append(subscription)
        }
    }
    
    func unsubscribe(_ subscriber: AnyObject) {
        if let index = self.indexOfSubscriber(subscriber) {
            self.subscriptions.remove(at: index)
        }
    }
    
    func setValueMuted(value: T) {
        self.muted = true
        self.value = value
        self.muted = false
    }
    
    private func indexOfSubscriber(_ subscriber: AnyObject) -> Int? {
        return self.subscriptions.index(where: { (otherSubscription) -> Bool in
            return otherSubscription.object === subscriber
        })
    }
    
}

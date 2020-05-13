//
//  UserAuthentication.swift
//  MyOwnPeriod
//
//  Created by Shalu Garikapaty on 5/7/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import Combine

class UserAuth: ObservableObject {

  let didChange = PassthroughSubject<UserAuth,Never>()

  // required to conform to protocol 'ObservableObject'
  let willChange = PassthroughSubject<UserAuth,Never>()

  func login() {
    // login request... on success:
    self.isLoggedin = true
  }

  var isLoggedin = false {
    didSet {
      didChange.send(self)
    }

    // willSet {
    //       willChange.send(self)
    // }
  }
}

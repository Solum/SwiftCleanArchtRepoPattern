//
//  CreateUserPresenter.swift
//  BabyNamesv2
//
//  Created by Felipe Caldas on 7/02/2016.
//  Copyright (c) 2016 FunkApps FMC. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol CreateUserPresenterInput
{
  func presentSomething(response: CreateUserResponse)
}

protocol CreateUserPresenterOutput: class
{
  func displayCreatedUser(viewModel: CreateUserViewModel)
    func showUserName(viewModel: CreateUserViewModel)
}

class CreateUserPresenter: CreateUserPresenterInput
{
  weak var output: CreateUserPresenterOutput!
  
  // MARK: Presentation logic
  
  func presentSomething(response: CreateUserResponse)
  {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller
    print("Presenter got data error:\(response.error)")
    if((response.firstName) != nil) {
        let viewModel = CreateUserViewModel(firstName: response.firstName!)
        output.displayCreatedUser(viewModel)
    } else if response.error {
        let viewModel = CreateUserViewModel(firstName: "There was an error")
        output.displayCreatedUser(viewModel)
    }
    
    showUserName(response)
  }
    
    func showUserName(response: CreateUserResponse) {
        if((response.firstName) != nil) {
            let viewModel = CreateUserViewModel(firstName: response.firstName!)
            output.showUserName(viewModel)
        } else if response.error {
            let viewModel = CreateUserViewModel(firstName: "There was an error")
            output.showUserName(viewModel)
        }
    }
}
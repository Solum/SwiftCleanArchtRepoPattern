//
//  CreateUserViewController.swift
//  BabyNamesv2
//
//  Created by Felipe Caldas on 7/02/2016.
//  Copyright (c) 2016 FunkApps FMC. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol CreateUserViewControllerInput
{
    func displayCreatedUser(viewModel: CreateUserViewModel)
    func showUserName(viewModel: CreateUserViewModel)
}

protocol CreateUserViewControllerOutput
{
    func createUser(request: CreateUserRequest)
    func fetchUser(request: CreateUserRequest)
}

class CreateUserViewController: UIViewController, CreateUserViewControllerInput
{
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    var output: CreateUserViewControllerOutput!
    var router: CreateUserRouter!
    
    
    @IBAction func doSignUp(sender: UIButton) {
        signUpUser()
    }
    
    // MARK: Object lifecycle
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        CreateUserConfigurator.sharedInstance.configure(self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        showUserName()
    }
    
    // MARK: Event handling
    
    func signUpUser() {
        // NOTE: Ask the Interactor to do some work
        
        let request = CreateUserRequest(id: nil, firstName: firstNameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
        output.createUser(request)
    }
    
    func showUserName() {
        output.fetchUser(CreateUserRequest(id: "1", firstName: firstNameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!))
    }
    
    // MARK: Display logic
    
    func displayCreatedUser(viewModel: CreateUserViewModel) {
        print("User was created! \(viewModel.firstName)")
        
    }
    
    func showUserName(viewModel: CreateUserViewModel) {
        //run all thise code in UI thread
        userNameLabel.text = viewModel.firstName
    }
}

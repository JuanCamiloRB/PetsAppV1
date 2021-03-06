//
//  SecondAllPresenter.swift
//  Camilo
//
//  Created by Juan C. Rodriguez B on 12/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SecondAllPresentationLogic
{
  func presentSomething(response: SecondAll.Something.Response)
}

class SecondAllPresenter: SecondAllPresentationLogic
{
  weak var viewController: SecondAllDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: SecondAll.Something.Response)
  {
    let viewModel = SecondAll.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}

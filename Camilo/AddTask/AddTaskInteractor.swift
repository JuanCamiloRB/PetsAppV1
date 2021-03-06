//
//  AddTaskInteractor.swift
//  Camilo
//
//  Created by Juan C. Rodriguez B on 11/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AddTaskBusinessLogic
{
  func doSomething(request: AddTask.Something.Request)
}

protocol AddTaskDataStore
{
  //var name: String { get set }
}

class AddTaskInteractor: AddTaskBusinessLogic, AddTaskDataStore
{
  var presenter: AddTaskPresentationLogic?
  var worker: AddTaskWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: AddTask.Something.Request)
  {
    worker = AddTaskWorker()
    worker?.doSomeWork()
    
    let response = AddTask.Something.Response()
    presenter?.presentSomething(response: response)
  }
}

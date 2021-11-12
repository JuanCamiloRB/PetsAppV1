//
//  FirstViewController.swift
//  Camilo
//
//  Created by Juan C. Rodriguez B on 8/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import DropDown
protocol FirstDisplayLogic: AnyObject
{
  func displaySomething(viewModel: First.Something.ViewModel)
}

class FirstViewController: UIViewController, FirstDisplayLogic, UITableViewDelegate, UITableViewDataSource
{
  var interactor: FirstBusinessLogic?
  var router: (NSObjectProtocol & FirstRoutingLogic & FirstDataPassing)?
    var checkT: Bool? = false
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var raseLbl: UILabel!
    @IBOutlet weak var raseBtn: UIButton!
    @IBOutlet weak var genBtn: UIButton!
    @IBOutlet weak var estBtn: UIButton!
 
    @IBOutlet weak var checkTerms: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var dateTableView: UITableView!
    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var imgDog: UIImageView!
    // MARK: Object lifecycle
  let dropDown = DropDown()
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = FirstInteractor()
    let presenter = FirstPresenter()
    let router = FirstRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
    nextBtn.layer.cornerRadius = 10
    imgDog.image = UIImage(named: "dog_1")
    tableView.register(UINib(nibName: "TextTableViewCell", bundle: nil), forCellReuseIdentifier: "TextTableViewCell")
    dateTableView.register(UINib(nibName: "date", bundle: nil), forCellReuseIdentifier: "date")
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    
    
    hideKeyboardWhenTappedAround(onView: self.view)
    tableView.delegate = self
    tableView.dataSource = self
    dateTableView.delegate = self
    dateTableView.dataSource = self
    
  }
    

    
    @objc func keyboardWillShow(notification:NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    
    @IBAction func showRaseBtn(_ sender: UIButton) {
        dropDown.dataSource = ["Chihuahua", "Bulldogge", "Boxer", "Bernhardiner", "Bobtail"]//4
          dropDown.anchorView = raseBtn //5
          dropDown.bottomOffset = CGPoint(x: 0, y: raseBtn.frame.size.height) //6
          dropDown.show() //7
          dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            sender.setTitle(item, for: .normal) //9
            
      }
        
    }
    @IBAction func showGen(_ sender: UIButton) {
        dropDown.dataSource = ["Männlich", "Weiblich"]//4
          dropDown.anchorView = genBtn //5
          dropDown.bottomOffset = CGPoint(x: 0, y: genBtn.frame.size.height) //6
          dropDown.show() //7
          dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            sender.setTitle(item, for: .normal) //9
            
      }
    
   }
    
    @IBAction func onEstBtn(_ sender: UIButton) {
        dropDown.dataSource = ["Kastriert", "Nicht kastriert"]//4
          dropDown.anchorView = estBtn //5
          dropDown.bottomOffset = CGPoint(x: 0, y: estBtn.frame.size.height) //6
          dropDown.show() //7
          dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            sender.setTitle(item, for: .normal) //9
        
      }
        
        
        
    }
    
    
    @IBAction func onCheckBtn(_ sender: Any) {
        
        let imageNormal = UIImage(named: "circle")!
        let imageCheck = UIImage(named: "new_moon")!
        
        if (checkT!) {
            checkT = false
            checkTerms.setImage(imageNormal, for: .normal)
        } else {
            checkT = true
            checkTerms.setImage(imageCheck, for: .normal)
        }
        
    }
    
    func showAlert(_ message:String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    
    @IBAction func onNextBtn(_ sender: Any) {
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextTableViewCell
        let texto = cell?.textField.text ?? ""
        
        let cell2 = dateTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? date
        let dateF = cell2?.dateText.text ?? ""
        if (texto.isEmpty) {
            showAlert("Nombre Requerido")
            return
        }
        if (dateF.isEmpty) {
            showAlert("Fecha Requerida")
            return
        }
        if (!isValidEmail(dateF)) {
            showAlert("Fecha no valida")
            return
        }
        if (!checkT!) {
            showAlert("Debes aceptar los términos y condiciones para poder continuar")
            return
            }
        
        let story = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")  as! SecondViewController
        self.navigationController?.pushViewController(story, animated: true)
        
    }
    func isValidEmail(_ dateF: String) -> Bool {
        let dateRegEx = #"^\d{1,2}[\..]\d{1,2}[\..]\d{4}$"#
        
        let datePred = NSPredicate(format:"SELF MATCHES %@", dateRegEx)
        return datePred.evaluate(with: dateF)
    }
    
    
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = First.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: First.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if tableView == self.tableView {
                    count = 1
                }
                
        if tableView == self.dateTableView {
            count =  1
        }
        return count!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as! TextTableViewCell
            cell.textField.placeholder = "Ingresa el nombre"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "date", for: indexPath) as! date
            cell.dateText.placeholder = "Ingresa la fecha"
        
        return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var count:Int?
        if tableView == self.tableView {
                    count = 55
                }
                
        if tableView == self.dateTableView {
            count =  55
            
        }
        
        return CGFloat(count!)
    }
    
}


    
    

extension UIViewController {
    func hideKeyboardWhenTappedAround(onView : UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        onView.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
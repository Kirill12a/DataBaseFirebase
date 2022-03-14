//
//  ViewController.swift
//  DataBaseFirebase
//
//  Created by Kirill Drozdov on 14.03.2022.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
  private let database = Database.database().reference()
  override func viewDidLoad() {
    super.viewDidLoad()

    database.child( "something").observeSingleEvent(of: .value) { snapshot in
      guard let value  = snapshot.value as? [String:Any] else {return  }

      print("value: \(value)")
    }

    let button = UIButton(frame: CGRect(x: 20, y: 200, width: view.frame.size.width - 40, height: 50  ))
    button.setTitle("Push me", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .link
    view.addSubview(button )
    button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)

    }

  @objc func addNewEntry(){
    let object: [String: Any] = [
      "name":"Kikos" as NSObject ,
      "YouTube":"Yes" 
    ]
    database.child("something\(Int.random(in: 0...100))").setValue(object)
  }


}


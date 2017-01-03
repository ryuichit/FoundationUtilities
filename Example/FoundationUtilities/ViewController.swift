//
//  ViewController.swift
//  FoundationUtilities
//
//  Created by RyuichiTanimoto on 01/03/2017.
//  Copyright (c) 2017 RyuichiTanimoto. All rights reserved.
//

import UIKit
import FoundationUtilities

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url = URL(string: "https://hoge")!
        let request = URLRequest(url: url)
        let result = URLSession(configuration: .default).synchronousDataTask(with: request)
        if let e = result.error {
            print("NG")
            print(e)
        } else {
            print("OK")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


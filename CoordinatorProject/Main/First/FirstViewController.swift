//
//  FirsViewController.swift
//  CoordinatorProject
//
//  Created by Daniil Kulikovskiy on 3/13/24.
//

import UIKit
import Combine

class FirstViewController: UIViewController {
    
    var infoLabel: UILabel?
    var viewModel: FirstTabViewModel!
    var showDetailRequest: () -> () = {}
    var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupInfoLabel()
        setupDetailButton()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        infoLabel?.text = "\(viewModel.name) \(viewModel.email)"
//    }
    
    func setupDetailButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 500, width: 200, height: 60))
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Go to Detail", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func setupInfoLabel() {
        let infoLabel = UILabel(frame: CGRect(x: 100, y: 300, width: 300, height: 60))
        view.addSubview(infoLabel)
        self.infoLabel = infoLabel
        viewModel.$email.combineLatest(viewModel.$name)
            .sink  { [unowned self] (email, name) in
                if !name.isEmpty && !email.isEmpty {
                    self.infoLabel?.text = "\(viewModel.name) with email \(viewModel.email)"
                } else {
                    infoLabel.text = ""
                }
            }
            .store(in: &subscriptions)

    }
    
    @objc func buttonTapped() {
        showDetailRequest()
    }
}

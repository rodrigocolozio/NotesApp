//
//  NoteController.swift
//  NotesiOSApp
//
//  Created by Rodrigo Colozio on 02/06/23.
//

import UIKit

class NoteDetailController: UIViewController {
    
        // MARK: - Attributes
    fileprivate var textView: UITextView = {
        let tf = UITextView()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = "Notes goes in here."
        tf.isEditable = true
        tf.font = .systemFont(ofSize: 18, weight: .regular)
        return tf
    }()
    
    fileprivate var dateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "June 02 2023 at 4:36pm"
        return label
    }()
    
        // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let items: [UIBarButtonItem] = [
            UIBarButtonItem(barButtonSystemItem: .organize, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .camera, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .compose, target: nil, action: nil),
        ]
        
        self.toolbarItems = items
        
        let topItems: [UIBarButtonItem] = [
            UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
        ]
        
        self.navigationItem.setRightBarButtonItems(topItems, animated: true)
    }
    
}

    // MARK: -  Methods and actions
extension NoteDetailController {
    
    fileprivate func setupUI() {
        self.view.addSubview(dateLabel)
        self.view.addSubview(textView)
        
        
        NSLayoutConstraint.activate([
            
            dateLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90),
            dateLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            textView.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

            
        
        ])
    }
}

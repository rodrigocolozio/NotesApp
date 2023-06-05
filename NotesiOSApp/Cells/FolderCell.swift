//
//  FolderCell.swift
//  NotesiOSApp
//
//  Created by Rodrigo Colozio on 02/06/23.
//

import UIKit

class FolderCell: UITableViewCell {
    
    var folderData: NoteFolder! {
        didSet {
            label.text = folderData.title
            countLabel.text = String(folderData.notes.count)
        }
    }
    
     var label: UILabel = {
       let label = UILabel()
        label.text = "Folder title"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
     var countLabel: UILabel = {
       let label = UILabel()
        label.text = "5"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    fileprivate lazy var stack: UIStackView = {
       let s = UIStackView(arrangedSubviews: [label, countLabel])
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = .horizontal
        s.spacing = 25
        return s
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.accessoryType = .disclosureIndicator
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FolderCell {
    
    fileprivate func setupUI() {
        contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            stack.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

        
        ])
        
    }
}

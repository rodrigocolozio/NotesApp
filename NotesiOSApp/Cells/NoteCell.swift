//
//  NoteCell.swift
//  NotesiOSApp
//
//  Created by Rodrigo Colozio on 02/06/23.
//

import UIKit

class NoteCell: UITableViewCell {
    
    
    // MARK: - Attributes
    var noteData: Note? {
        didSet {
            guard let noteData = noteData else { return }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM dd, yyyy"            
            noteTitle.text = noteData.title
            dateLabel.text = dateFormatter.string(from: noteData.date)
            previewLabel.text = noteData.text
        }
    }
    
    // note title
    fileprivate var noteTitle: UILabel = {
        let label = UILabel()
        label.text = "Places to take photos"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    // date label
    fileprivate var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "03 22 2023"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .gray
        return label
    }()
    // preview label
    fileprivate var previewLabel: UILabel = {
        let label = UILabel()
        label.text = "The best places to take a really good photo are listed above: "
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor.gray.withAlphaComponent(0.8)
        return label
    }()
    // horizontal stack view
    fileprivate lazy var horizontalStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [dateLabel, previewLabel])
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = .horizontal
        s.spacing = 10
        return s
    }()
    // vertical stack view
    fileprivate lazy var verticalStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [noteTitle, horizontalStackView])
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = .vertical
        s.spacing = 4
        return s
    }()
    
    
    // MARK: - View
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NoteCell {
    
    fileprivate func setupUI() {
        contentView.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            verticalStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        
        ])
        
    }
}

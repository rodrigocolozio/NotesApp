//
//  ViewController.swift
//  NotesiOSApp
//
//  Created by Rodrigo Colozio on 02/06/23.
//

import UIKit

var firstFoldernotes = [
    Note(title: "UITableViews", date: Date(), text: "table view use protocols to recieve data."),
    Note(title: "Collection Views", date: Date(), text: "collections views can be customized with flow layouts to create layouts like you see in the Pinterest."),
    Note(title: "Flow Layouts", date: Date(), text: "custom layouts can be made with UICollectionsViewFlowLayouts"),
]

var secondeFolderNotes = [
    Note(title: "Instagram", date: Date(), text: "This is a instagram page"),
    Note(title: "YouTube", date: Date(), text: "This is an account"),
]

var noteFolders: [NoteFolder] = [
    NoteFolder(title: "Course Notes", notes: firstFoldernotes),
    NoteFolder(title: "Social Media", notes: secondeFolderNotes),

]
    // MARK: - Main
class FoldersController: UITableViewController {
    
    
    // MARK: - Attributes
    fileprivate let CELL_ID: String = "CELL_ID"
    fileprivate let headerView: UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        let label = UILabel(frame: CGRect(x: 15, y: 20, width: 100, height: 20))
        label.text = "iCloud"
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textColor = .darkGray
//        headerView.addBorder(toSide: .bottom, withColor: UIColor.lightGray.cgColor, andThickness: )
        headerView.addSubview(label)
        return headerView
    }()
    
    fileprivate var textField: UITextField!
    
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Folders"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setToolbarHidden(false, animated: false)
        
        let items: [UIBarButtonItem] = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "New Folder", style: .done, target: self, action: #selector(handleAddNewFolder))
        ]
        self.toolbarItems = items
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = editButton
        self.navigationController?.navigationBar.tintColor = .cyan
        self.navigationController?.toolbar.tintColor = .cyan
        
        setupTranslucentViews()
    }
}
    
    // MARK: - Methods and actions
extension FoldersController {
    
    fileprivate func setupTableView() {
        tableView.register(FolderCell.self, forCellReuseIdentifier: CELL_ID)
        tableView.tableHeaderView = headerView
    }
    
    fileprivate func getImage (withColor color: UIColor, andSize size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
    
    fileprivate func setupTranslucentViews() {
        let toolBar = self.navigationController?.toolbar
        let navigationBar = self.navigationController?.navigationBar
        
        let slightWhite = getImage(withColor: UIColor.white.withAlphaComponent(0.9), andSize: CGSize(width: 30, height: 30))
        toolBar?.setBackgroundImage(slightWhite, forToolbarPosition: .any, barMetrics: .default)
        toolBar?.setShadowImage(UIImage(), forToolbarPosition: .any)
        
        navigationBar?.setBackgroundImage(slightWhite, for: .default)
        navigationBar?.shadowImage = slightWhite
    }
    
     @objc fileprivate func handleAddNewFolder() {
         let addAlert = UIAlertController(title: "New Folder", message: "Enter a name for this folder", preferredStyle: .alert)
         
         addAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
         
         addAlert.addTextField() {  (tf) in
             tf.placeholder = "Folder's Name"
             self.textField = tf
         }
         
         addAlert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
             addAlert.dismiss(animated: true)
             // insert a new folder with the corret title
             guard let title = self.textField.text else { return }
             let newFolder = NoteFolder(title: title, notes: [])
             noteFolders.append(newFolder)
             self.tableView.insertRows(at: [IndexPath(row: noteFolders.count - 1, section: 0)], with: .fade)
         }))
         
         present(addAlert, animated: true)
     }
    
}

    // MARK: - TableView DataSource and Delegate
extension FoldersController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! FolderCell
        let folderForRow = noteFolders[indexPath.row]
        cell.folderData = folderForRow
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteFolders.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let folderNotesController = FolderNotesController()
        let folderForRowSelected = noteFolders[indexPath.row]
        folderNotesController.folderData = folderForRowSelected
        navigationController?.pushViewController(folderNotesController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}


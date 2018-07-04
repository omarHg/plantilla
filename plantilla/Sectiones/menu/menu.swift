//
//  menu.swift
//  plantilla
//
//  Created by Omar Hernandez on 26/06/18.
//  Copyright © 2018 Omar Hernandez. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

class menu: UITableViewController {
    var cellsArray:Array<UITableViewCell> = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.backgroundColor = .white
        self.edgesForExtendedLayout = .init(rawValue: 0)
        self.navigationController?.isNavigationBarHidden = true
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIDevice.current.type {
            case .iPhoneX:
                tableView.contentInset = UIEdgeInsetsMake(-44, 0, 0, 0)
            default:
                tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0)
            }
        }
        inicell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellsArray[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsArray.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(indexPath.row)
        if cellsArray[indexPath.row].isKind(of: menuCell.self){
            let tag = (cellsArray[indexPath.row] as! menuCell).tag
            
            if tag == 0 {
                let view = controllerX()
                let navigation = UINavigationController()
                navigation.pushViewController(view, animated: true)
                
                self.present(navigation, animated: false, completion: nil)
                
            }
            
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 150
        }
        
        if(indexPath.row == 4){
            return 5
        }
        
        if indexPath.row == 1 || indexPath.row == 5 {
            return 30
        }
        
        return 50
    }
    
    
    
}

extension menu {
    func inicell() {
        
        let cellHeader = menuCellHeader(style: UITableViewCellStyle.default, reuseIdentifier: "Profile")
        cellHeader.nameTitle = "titulo"
        cellHeader.nameuser = "Omar Hernandez Gonzalez"
        //cellHeader.imgBackground = UIImage(named: "header")
        
        let cellOption1 = menuCell(style: UITableViewCellStyle.default, reuseIdentifier: "Profile")
        //cellMisPagos.imgicono = UIBarButtonItem.
        cellOption1.tag = 0
        cellOption1.nameTitle = "opcion 1"
        
        
        
        
        
        cellsArray = [cellHeader,cellOption1]
        
    }
}

class menuCell: UITableViewCell {
    
    var img_icono:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear /*Cambio gris a gris mas obscuro*/
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var imgicono:UIImage? = nil{
        didSet{
            self.img_icono.image = self.imgicono
        }
    }
    
    var lbl_title:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = fontSystem(tamano: 16, bold: false)//UIFont(name: "Arial-BoldMT", size: 16.0)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameTitle = ""{
        didSet{
            self.lbl_title.text = self.nameTitle
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellConstraints()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    func cellConstraints(){
        
        
        contentView.addSubview(img_icono)
        contentView.addSubview(lbl_title)
        contentView.addConstraintsWithFormat("V:[v0(30)]", views: img_icono)
        contentView.addConstraintsWithFormat("V:[v0]", views: lbl_title)
        contentView.addConstraintsWithFormat("H:|-[v0(30)]-[v1]-|", views: img_icono,lbl_title)
        
        contentView.addConstraint(NSLayoutConstraint(item: img_icono, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        contentView.addConstraint(NSLayoutConstraint(item: lbl_title, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        
    }
}
class menuCellHeader: UITableViewCell {
    var img_backGround:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear /*Cambio gris a gris mas obscuro*/
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var imgBackground:UIImage? = nil{
        didSet{
            self.img_backGround.image = self.imgBackground
        }
    }
    var lbl_title:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = fontSystem(tamano: 16, bold: true)//UIFont(name: "Arial-BoldMT", size: 16.0)
        label.numberOfLines = 1
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 2.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 3, height: 3)
        label.layer.masksToBounds = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameTitle = ""{
        didSet{
            self.lbl_title.text = self.nameTitle
        }
    }
    
    var lbl_user:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = fontSystem(tamano: 16, bold: true)//UIFont(name: "Arial-BoldMT", size: 16.0)
        label.numberOfLines = 1
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 2.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 3, height: 3)
        label.layer.masksToBounds = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameuser = ""{
        didSet{
            self.lbl_user.text = self.nameuser
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    func cellConstraints(){
        contentView.addSubview(img_backGround)
        contentView.addSubview(lbl_title)
        contentView.addSubview(lbl_user)
        
        contentView.addConstraintsWithFormat("V:|[v0(150)]|", views: img_backGround)
        contentView.addConstraintsWithFormat("H:|[v0]|", views: img_backGround)
        
        contentView.addConstraintsWithFormat("V:|-30-[v0(20)]", views: lbl_title)
        contentView.addConstraintsWithFormat("H:|-[v0]-|", views: lbl_title)
        
        contentView.addConstraintsWithFormat("V:[v0(20)]-|", views: lbl_user)
        contentView.addConstraintsWithFormat("H:|-[v0]-|", views: lbl_user)
    }
}
class menuCellTitle: UITableViewCell {
    
    var lbl_title:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = fontSystem(tamano: 16, bold: false)//UIFont(name: "Arial-BoldMT", size: 16.0)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameTitle = ""{
        didSet{
            self.lbl_title.text = self.nameTitle
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    func cellConstraints(){
        contentView.addSubview(lbl_title)
        contentView.addConstraintsWithFormat("V:[v0]", views: lbl_title)
        contentView.addConstraintsWithFormat("H:|-[v0]-|", views: lbl_title)
        
        contentView.addConstraint(NSLayoutConstraint(item: lbl_title, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }
}

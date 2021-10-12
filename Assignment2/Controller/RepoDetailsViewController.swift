//
//  RepoDetailsViewController.swift
//  Assignment2
//
//  Created by Coditas on 07/10/21.
//

import UIKit
import Kingfisher

class RepoDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var repoDetailTableView: UITableView!
   
    var usersViewModel = UsersViewModel()
    var user:[User]?
    var repoUser : [Repo]?
    var idValue:Int?
    var singleUser = [Any]()
    
    var cellTitles =  ["Repository Name:","Repository Description:","Repository URL:","Language:","Created on:"]
    var cellLogo = [UIImage(systemName: "square.stack.3d.up.fill"),UIImage(systemName:"folder"),UIImage(systemName:"minus.rectangle"),UIImage(systemName:"arrow.left.and.right"),UIImage(systemName:"calendar")]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        repoDetailTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        forEachUser()
        self.repoDetailTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //headerLabel.text = user![idValue!].login
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 130))
        let headerImage = UIImageView()
        
        headerImage.kf.setImage(with: URL(string: user![idValue!].avatar_url))
        header.addSubview(headerImage)
        headerImage.frame = CGRect(x: 10, y: 10, width: header.frame.size.height - 15, height: header.frame.size.height - 15)
        headerImage.layer.cornerRadius = headerImage.frame.size.width/2
               headerImage.clipsToBounds = true

        
        let headerLabel = UILabel(frame: CGRect(x: 20+headerImage.frame.size.width, y: 10, width: header.frame.size.width - 15 - headerImage.frame.size.width , height: header.frame.size.height - 10))
        header.addSubview(headerLabel)
        headerLabel.font = .systemFont(ofSize: 25, weight: .bold)
        headerLabel.text = user![idValue!].login
        
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 130
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    //return 4
    }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repoDetailTableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.labelIcon.image = cellLogo[indexPath.row]
        cell.celTitle.text = cellTitles[indexPath.row]
        if cellTitles[indexPath.row] == "Repository URL:"{
            singleUser.insert(user![idValue!].repos_url, at: 2)
        }
        cell.cellData.text = singleUser[indexPath.row] as? String ?? nil
              return cell
       }
    func forEachUser(){
        let mirrorObj = Mirror(reflecting: repoUser![idValue!])
          for (index,attr) in mirrorObj.children.enumerated(){
              if let property_name = attr.label as String?{
                  print("Attr \(index): \(property_name) = \(attr.value)")
                if !(attr.value is NSNull){
                    singleUser.append(attr.value as Any)
                    print("abc",singleUser)
                }
                else{
                    print("print nil")
                }
            }
          }
    }
  
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
  

}

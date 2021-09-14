
import UIKit
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var usersViewModel = UsersViewModel()
    var gitUser = [User]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func searchBarSearchButtonClicked(_ searchBar:UISearchBar){
        if let text = searchBar.text{
            gitUser = []
            tableView.reloadData()
                self.usersViewModel.parseJsonUrl(query: text) { (data) in
                    self.gitUser = data
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
            }
        }
    }
    //completion : @escaping([User])->()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitUser.count
        //return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        
        let imgUrl = URL(string: gitUser[indexPath.row].avatar_url)
        cell.userImg.kf.setImage(with: imgUrl)
        cell.userName.text = gitUser[indexPath.row].login
        cell.userScore.text = "\(gitUser[indexPath.row].score)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
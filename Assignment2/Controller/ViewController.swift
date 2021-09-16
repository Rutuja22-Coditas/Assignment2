
import UIKit
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var usersViewModel = UsersViewModel()
    var gitUser = [User]()
    var repo_url = [Repo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func searchBarSearchButtonClicked(_ searchBar:UISearchBar){
        if let text = searchBar.text{
            gitUser = []
            tableView.reloadData()
                self.usersViewModel.parseJsonUrl(query: text) { (data) in
                    self.gitUser = data
//
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
            }
            if self.gitUser.count == 0{
                self.showAlert()
            }
            repo_url = []
            self.usersViewModel.parseRepoUrl(query: text) { (data) in
                    self.repo_url = data
            }
        }
    }
    
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
        cell.tapBlock = { [self] in
            let newVC = self.storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
            newVC.idValue = indexPath.row
            newVC.user = self.gitUser
            newVC.repoUser = self.repo_url
            
            self.navigationController?.pushViewController(newVC, animated: true)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func showAlert(){
        let alert = UIAlertController(title: "Error!", message: "No Results Found", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
        }))
        present(alert, animated: true)
    }
}


import UIKit

protocol FavoriteView: AnyObject {
    
    func update()
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var presenter: FavoritePresenter!
    var titleBar = "Favorite films"

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        addButton()
        setupTable()
        update()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        update()
    }

    func inject(presenter: FavoritePresenter) {
        self.presenter = presenter
    }
}

extension ViewController: FavoriteView {
    
}

// MARK: - SetNavigationBar

extension ViewController {
    
    func setTitle() {
        self.navigationItem.title = titleBar
    }
    
    func addButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapButton(_:)))
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        self.presenter.openView()
    }
}

// MARK: - TableView

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.decription.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.reuseIdentifier, for: indexPath) as! FavoriteTableViewCell
        let model = self.presenter.decription[indexPath.row]
        cell.setLabel(title: model.title)
        
        return cell
    }
}

// MARK: - SetupTableView

extension ViewController {
    
    func setupTable() {
        tableView.register(UINib(
            nibName: FavoriteTableViewCell.reuseIdentifier,
            bundle: nil), forCellReuseIdentifier: FavoriteTableViewCell.reuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Update

extension ViewController {
    
    func update() {
        tableView.reloadData()
    }
}




import UIKit

protocol FavoriteView: AnyObject {
    
}

class ViewController: UIViewController {
    
    private var presenter: FavoritePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func inject(presenter: FavoritePresenter) {
        self.presenter = presenter
    }
}

extension ViewController: FavoriteView {
    
}



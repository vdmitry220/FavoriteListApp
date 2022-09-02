
import UIKit

protocol NewFilmView: AnyObject {
    
}

class NewFilmViewController: UIViewController {
    
    private var presenter: NewFilmPresenter!


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func inject(presenter: NewFilmPresenter) {
        self.presenter = presenter
    }
    
}

extension NewFilmViewController: NewFilmView {
    
}

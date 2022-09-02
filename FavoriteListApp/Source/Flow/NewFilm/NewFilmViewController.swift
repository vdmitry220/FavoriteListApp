
import UIKit

protocol NewFilmView: AnyObject {
    
}

class NewFilmViewController: UIViewController {
    
    @IBOutlet private weak var movieTtitle: UITextField!
    @IBOutlet private weak var year: UITextField!
    @IBOutlet private weak var addButton: UIButton!
    
    private var presenter: NewFilmPresenter!


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func inject(presenter: NewFilmPresenter) {
        self.presenter = presenter
    }
    
    @IBAction func addDidTap(_ sender: Any) {
        self.presenter.getDescription(title: movieTtitle.text ?? "", year: year.text ?? "")
    }
}

extension NewFilmViewController: NewFilmView {
    
}

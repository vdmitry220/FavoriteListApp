
import UIKit

protocol NewMovieView: AnyObject {
    
}

class NewMovieViewController: UIViewController {
    
    @IBOutlet private weak var movieTtitle: UITextField!
    @IBOutlet private weak var year: UITextField!
    @IBOutlet private weak var addButton: UIButton!
    
    private var presenter: NewMoviePresenter!


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func inject(presenter: NewMoviePresenter) {
        self.presenter = presenter
    }
    
    @IBAction func addDidTap(_ sender: Any) {
        self.presenter.getDescription(title: movieTtitle.text ?? "", year: year.text ?? "")
    }
}

extension NewMovieViewController: NewMovieView {
    
}

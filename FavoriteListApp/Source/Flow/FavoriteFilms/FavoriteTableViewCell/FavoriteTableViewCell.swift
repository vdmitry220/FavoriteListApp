
import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var year: UILabel!
    
    let numberOfLines = 0
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

// MARK: - ReuseIdentifier

extension FavoriteTableViewCell {
    
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

// MARK: - Update

extension FavoriteTableViewCell {
    
    func updateLabel(model: Movie) {
        self.title.text = model.title
        let movieYear = String(model.year)
        self.year.text = movieYear
    }
    
    func setupLabel() {
        self.title.numberOfLines = numberOfLines
        self.year.numberOfLines = numberOfLines
    }
}

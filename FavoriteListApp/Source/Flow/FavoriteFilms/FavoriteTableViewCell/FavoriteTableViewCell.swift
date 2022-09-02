
import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var year: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
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
    
    func setLabel(title: String) {
        self.title.text = title
    }
}

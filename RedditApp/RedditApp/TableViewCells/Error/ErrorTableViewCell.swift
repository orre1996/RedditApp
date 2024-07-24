//
//  ErrorTableViewCell.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import UIKit

class ErrorTableViewCell: UITableViewCell {
    @IBOutlet weak var errorLabel: UILabel!

    override func awakeFromNib() {
        backgroundColor = .clear
        selectionStyle = .none
    }

    func setup(message: String) {
        errorLabel.text = message
    }
}

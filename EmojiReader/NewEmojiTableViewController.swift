//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by Sergey Borichev on 16.06.2021.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    var emoji = Emoji(emoji: "", name: "", description: "", isFavorite: false)
    
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func changeTextField(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSaveButtonState()
        updateUI()
    }
    
    
    private func updateSaveButtonState() {
        
        let emojiText = emojiTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
    }
    private func updateUI() {
        
        emojiTextField.text = emoji.emoji
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return}
        let emoji = emojiTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        
        self.emoji = Emoji(emoji: emoji, name: name, description: description, isFavorite: self.emoji.isFavorite)
    }
}

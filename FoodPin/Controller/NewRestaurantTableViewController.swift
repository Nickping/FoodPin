//
//  NewRestaurantTableViewController.swift
//  FoodPin
//
//  Created by Euijoon Jung on 2018. 8. 6..
//  Copyright © 2018년 AppCoda. All rights reserved.
//

import UIKit

protocol newRestaurantItem {
    func newRestaurantCreated(name: String, type: String, location: String, phone: String, description: String, image: String, isVisited: Bool)
    
    
}


class NewRestaurantTableViewController: UITableViewController,UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    
    
    @IBOutlet weak var restaurantPhone: UITextField!
    @IBOutlet weak var restaurantAddress: UITextField!
    @IBOutlet weak var restaurantType: UITextField!
    @IBOutlet weak var restaurantName: UITextField!
    @IBOutlet weak var restaurantDescription: UITextView!
    
    @IBOutlet weak var restaurantImage: UIImageView!
    
    var delegate : newRestaurantItem?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    override func viewWillAppear(_ animated: Bool) {
        restaurantName.delegate = self
        restaurantAddress.delegate = self
        restaurantType.delegate = self
        restaurantPhone.delegate = self
        
    }
    
    @IBAction func onSaveButtonPressed(_ sender: UIBarButtonItem) {
        
//        delegate?.newRestaurantCreated(name: restaurantName.text!, type: restaurantType.text!, location: restaurantAddress.text!, phone: restaurantPhone.text!, description: restaurantDescription.text!, image: , isVisited: false)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag+1){
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        return true
    }
    
    
    @IBAction func onCloseButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photoSourceRequestController = UIAlertController(title: "", message: "Choose your photo source", preferredStyle: .actionSheet)
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .camera
                    imagePicker.delegate = self
                    self.present(imagePicker, animated: true, completion: nil) }
            })
            let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default, handler: { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .photoLibrary
                    imagePicker.delegate = self
                    self.present(imagePicker, animated: true, completion: nil) }
            })
            photoSourceRequestController.addAction(cameraAction)
            photoSourceRequestController.addAction(photoLibraryAction)
            present(photoSourceRequestController, animated: true, completion: nil) }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            restaurantImage.image = selectedImage
            restaurantImage.contentMode = .scaleAspectFill
            restaurantImage.clipsToBounds = true
        }
        let leadingConstraint = NSLayoutConstraint(item: restaurantImage, attribute: .leading, relatedBy: .equal, toItem: restaurantImage.superview, attribute: .leading, multiplier: 1, constant: 0)
        
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: restaurantImage, attribute: .trailing, relatedBy: .equal, toItem: restaurantImage.superview, attribute: .trailing, multiplier: 1, constant: 0)
        
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: restaurantImage, attribute: .top, relatedBy: .equal, toItem: restaurantImage.superview, attribute: .top, multiplier: 1, constant: 0)
        
        topConstraint.isActive = true
        let bottomConstraint = NSLayoutConstraint(item: restaurantImage, attribute: .bottom, relatedBy: .equal, toItem: restaurantImage.superview, attribute: .bottom, multiplier: 1, constant: 0)
        
        bottomConstraint.isActive = true
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    //
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

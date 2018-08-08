//
//  RatingViewController.swift
//  FoodPin
//
//  Created by Euijoon Jung on 2018. 8. 6..
//  Copyright © 2018년 AppCoda. All rights reserved.
//

import UIKit

protocol onRateListener {
    func onRateChanged(rate : String)
}


class RatingViewController: UIViewController{
    
    
    var onRateListenerDelegate : onRateListener?
    var restaurant =  Restaurant()
    
    @IBAction func onRateChanged(_ sender: UIButton) {
        
        var rate :String = ""
        switch sender.tag{
        case 0: rate = "love"
            break
        case 1:
            rate = "cool"
            break;
        case 2:
            rate = "happy"
            break;
        case 3:
            rate = "sad"
            break;
        case 4:
            rate = "angry"
            break;
            
        default:
            rate = ""
            break
        }
        onRateListenerDelegate?.onRateChanged(rate: rate)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet var rateButtons : [UIButton]!
    
    @IBOutlet weak var backgroundView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        backgroundView.image = UIImage(named: restaurant.image)
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundView.addSubview(blurEffectView)
        
        //animation fade-in
        
        for buttons in rateButtons {
            buttons.alpha = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 2.0) {//2초로 애니메이션
            
            for button in self.rateButtons {
                button.alpha = 1.0
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

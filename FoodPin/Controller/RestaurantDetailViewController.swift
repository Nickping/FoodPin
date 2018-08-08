import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, onRateListener {
    func onRateChanged(rate: String) {
        print(rate)
        restaurant.rate = rate
        HeaderView.rateView.image = UIImage(named: restaurant.rate)
    }
    
    
    
    // MARK: - Properties
    
    var restaurant: Restaurant = Restaurant()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var HeaderView: RestaurantHeaderView!
    // MARK: - View controller life style
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        HeaderView.headerImageView.image = UIImage(named: restaurant.image)
        HeaderView.nameLabel.text = restaurant.name
        HeaderView.typeLabel.text = restaurant.type
        if restaurant.isVisited {
            HeaderView.heartImageView.image = UIImage(named: "heart-tick")
            HeaderView.heartImageView.tintColor = UIColor.white
        }
        
        
        tableView.register(UINib(nibName: "MyIconTextTableViewCell", bundle: nil), forCellReuseIdentifier: "MyIconTextTableViewCell")
        tableView.register(UINib(nibName: "DetailTextTableViewCell", bundle: nil), forCellReuseIdentifier: "detailTextView")
        tableView.register(UINib(nibName: "MyMapTableViewCell", bundle: nil), forCellReuseIdentifier: "MyMapTableViewCell")
        navigationItem.largeTitleDisplayMode = .never
        tableView.separatorStyle = .none
        
        
        // MARK: - 네비게이션 바 숨기기
        //        navigationController?.navigationBar.tintColor = .white
        //        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyIconTextTableViewCell", for: indexPath) as! MyIconTextTableViewCell
            cell.myRestaurantImageView.image = UIImage(named: "phone")
            cell.myRestaurantLabelView.text = restaurant.phone
            return cell
            
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyIconTextTableViewCell", for: indexPath) as! MyIconTextTableViewCell
            cell.myRestaurantImageView.image = UIImage(named: "map")
            cell.myRestaurantLabelView.text = restaurant.location
            
            return cell
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailTextView", for: indexPath) as! DetailTextTableViewCell
            cell.detailText.text = restaurant.description
            
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailTextView", for: indexPath) as!DetailTextTableViewCell
            cell.detailText.text = "How to Get there"
            
            return cell
        case 4:
            
            print("cell 4")
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyMapTableViewCell", for: indexPath) as! MyMapTableViewCell
            
            cell.configure(location: restaurant.location)
            return cell
            
        default:
            
            fatalError()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            performSegue(withIdentifier: "showMap", sender: indexPath.self)
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare!")
        if segue.identifier == "showMap" {
            let nextVC = segue.destination as! MapViewController
            nextVC.restaurant = restaurant
            
        }else if segue.identifier == "showReview" {
            let nextVc = segue.destination as! RatingViewController
            nextVc.restaurant = restaurant
            nextVc.onRateListenerDelegate = self
        }
    }
    
    
}

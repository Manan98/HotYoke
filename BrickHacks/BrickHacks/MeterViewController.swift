//RATE $0.10 PER 1.0 GB


import UIKit
//import ifaddrs
class MeterViewController: UIViewController {
    
    var username: String = ""
    var password: String = ""
    var provider: String = ""
    
    var creditsLabel: UILabel!
    var end: UIButton!
    
    
    var timer = Timer()
    
    var titleLabel: UILabel!
    
    var counterLabel: UILabel!
    var count = 0
    var cred = 0
    var once = true
    //let usage = getDataUsage()
    
    
    /*init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, username: String, password: String, provider: String) {
        self.username = username
        self.password = password
        self.provider = provider + "@cornell.edu"
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        //SEND EMAIL TO PROVIDER THAT SESSION HAS STARTED
        
        //Display METER
        /// Basic constants for easily adjusting views
        let labelLeftEdgeInset: CGFloat = 20
        let textFieldTopInset: CGFloat = 200
        let textFieldHeight: CGFloat = 40
        let textFieldSeparator: CGFloat = 10
        let textFieldLabelWidth = view.frame.width * 0.2 - labelLeftEdgeInset
        //let textFieldWidth = view.frame.width * 0.8 - labelLeftEdgeInset - 50
        
        
        titleLabel = UILabel(frame: CGRect(x: view.center.x - 115, y: textFieldTopInset - 80, width: textFieldLabelWidth + 200, height: textFieldHeight))
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.text = "Your Session Has Started"
        titleLabel.textAlignment = .center
        
        counterLabel = UILabel(frame: CGRect(x: view.center.x - 75, y: textFieldTopInset, width: textFieldLabelWidth + 100, height: textFieldHeight))
        //counterLabel.center = CGPoint(x: view.center.x, y: counterLabel.center.y)
        counterLabel.textAlignment = .center
        
        creditsLabel = UILabel(frame: CGRect(x: view.center.x - 75, y: counterLabel.frame.origin.y + counterLabel.frame.height + 50, width: textFieldLabelWidth + 100, height: textFieldHeight - 10))
        //creditsLabel.center = CGPoint(x: view.center.x - 48, y: textFieldTopInset + 20)
        creditsLabel.textAlignment = .center
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        
        end = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.65, width: view.frame.width / 2.0, height: 50))
        end.center = CGPoint(x: view.center.x, y: end.center.y)
        end.setTitle("END", for: .normal)
        end.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: .normal)
        end.setTitleColor(.lightGray, for: .highlighted)
        end.addTarget(self, action: #selector(endButtonPressed), for: .touchUpInside)

        view.addSubview(titleLabel)
        view.addSubview(end)
        view.addSubview(creditsLabel)
        view.addSubview(counterLabel)
        // Do any additional setup after loading the view.
    }
    
    func endButtonPressed() {
        //end
        let url = URL(string: "https://api.sparkpost.com/api/v1/metrics/deliverability/aggregate?campaigns=testjob&from=2014-01-23T14:00&metrics=count_targeted,count_sent,count_accepted&timezone=America%2FNew_York&to=2014-06-23T15:50")
        
        var urlRequest = URLRequest(url: url!)
        
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("9aaacc0ef158a01d2fb8b21b2487749df1157073", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let jsonObject0: [String: String] = [
            "from": username + "@cornell.edu",
            "subject":"Hot Yoke Transaction",
            "text":"The transaction from " + username + " has terminated and you have gained " + String(cred) + " credits"
        ]
        let jsonObject1: [String: String] = [
            "address":"" + provider + "@cornell.edu"
        ]
        
        let jsonObject: [String: AnyObject] = [
            "content":jsonObject0 as AnyObject,
            "recipients":jsonObject1 as AnyObject
            
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject)
        
        
        urlRequest.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
        
        cred = count * 2
        counterLabel.text = "\(count)" + " seconds"
        creditsLabel.text = "Credits: " + "\(cred)"
        timer.invalidate()
    }
    
    
    func counter() {
        //count
        count += 1
        
        
        if count == 12 && once {
            once = false
            count = 1
            cred = 2
            creditsLabel.text = "Credits: " + "\(cred)"
            
            //SEND EMAIL
            //creditsLabel.center = CGPoint(x: view.center.x, y: view.center.y * 1.5)
            //9aaacc0ef158a01d2fb8b21b2487749df1157073
            
            let url = URL(string: "https://api.sparkpost.com/api/v1/metrics/deliverability/aggregate?campaigns=testjob&from=2014-01-23T14:00&metrics=count_targeted,count_sent,count_accepted&timezone=America%2FNew_York&to=2014-06-23T15:50")
            
            var urlRequest = URLRequest(url: url!)
            
            
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("9aaacc0ef158a01d2fb8b21b2487749df1157073", forHTTPHeaderField: "Authorization")
            urlRequest.httpMethod = "POST"
            //urlRequest.httpBody =
            
            
            /*
            '{
                "content": 
                    {
                        "from": "testing@sparkpostbox.com",
                        "subject": "Oh hey",
                        "text":"Testing SparkPost - the most awesomest email service in the world"
                    },
                "recipients": [{"address": "developers+curl@sparkpost.com"}]
             
             }'
            
             let savedData = ["Something": 1]
             
             let jsonObject: [String: AnyObject] = [
             "type_id": 1,
             "model_id": 1,
             "transfer": [
             "startDate": "10/04/2015 12:45",
             "endDate": "10/04/2015 16:00"
             ],
             "custom": savedData
             ]
            */
            
            let jsonObject0: [String: String] = [
                "from": username + "@cornell.edu",
                "subject":"Hot Yoke Transaction",
                "text":"The transaction from " + username + " has begun"
            ]
            let jsonObject1: [String: String] = [
                "address":"" + provider + "@cornell.edu"
            ]
            
            let jsonObject: [String: AnyObject] = [
                "content":jsonObject0 as AnyObject,
                "recipients":jsonObject1 as AnyObject
            
            ]
            
            let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject)

            
            urlRequest.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    return
                }
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [String: Any] {
                    print(responseJSON)
                }
            }
            
            task.resume()
            
        }
        else if count % 5 == 1 {
            cred = cred + 10
            creditsLabel.text = "Credits: " + "\(cred)"
        }
        else if count == 1800 {
            let url = URL(string: "https://api.sparkpost.com/api/v1/metrics/deliverability/aggregate?campaigns=testjob&from=2014-01-23T14:00&metrics=count_targeted,count_sent,count_accepted&timezone=America%2FNew_York&to=2014-06-23T15:50")
            
            var urlRequest = URLRequest(url: url!)
            
            
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("9aaacc0ef158a01d2fb8b21b2487749df1157073", forHTTPHeaderField: "Authorization")
            urlRequest.httpMethod = "POST"
            
            let jsonObject0: [String: String] = [
                "from": username + "@cornell.edu",
                "subject":"Hot Yoke Transaction",
                "text":"The transaction from " + username + " has passed 30 minutes and you have gained " + String(cred) + " credits"
            ]
            let jsonObject1: [String: String] = [
                "address":"" + provider + "@cornell.edu"
            ]
            
            let jsonObject: [String: AnyObject] = [
                "content":jsonObject0 as AnyObject,
                "recipients":jsonObject1 as AnyObject
                
            ]
            
            let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject)
            
            
            urlRequest.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    return
                }
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [String: Any] {
                    print(responseJSON)
                }
            }
            
            task.resume()
            
        }
        
        
        
        counterLabel.text = "\(count)" + " seconds"
    }
    
    
    
    
    
    
    
    
    
    
    
    /*
    func getDataUsage() -> (wifi : (sent : UInt32, received : UInt32), wwan : (sent : UInt32, received : UInt32)) {
        var interfaceAddresses : UnsafeMutablePointer<ifaddrs>? = nil
        var networkData: UnsafeMutablePointer<if_data>? = nil
        
        var returnTuple : (wifi : (sent : UInt32, received : UInt32), wwan : (sent : UInt32, received : UInt32)) = ((0, 0), (0, 0))
        
        if getifaddrs(&interfaceAddresses) == 0 {
            do{
            while var pointer = interfaceAddresses && counter != nil && counter = counter?.pointee.ifa_next {
                
                let name : String! = String.init(describing: pointer!.pointee.ifa_name)
                print(name)
                let flags = Int32((pointer?.pointee.ifa_flags)!)
                var addr = pointer?.pointee.ifa_addr.pointee
                
                if addr?.sa_family == UInt8(AF_LINK) {
                    if name.hasPrefix("en") {
                        networkData = unsafeBitCast(pointer?.pointee.ifa_data, to: UnsafeMutablePointer<if_data>.self)
                        returnTuple.wifi.sent += (networkData?.pointee.ifi_obytes)!
                        returnTuple.wifi.received += (networkData?.pointee.ifi_ibytes)!
                    } else if name.hasPrefix("pdp_ip") {
                        networkData = unsafeBitCast(pointer?.pointee.ifa_data, to: UnsafeMutablePointer<if_data>.self)
                        returnTuple.wwan.sent += (networkData?.pointee.ifi_obytes)!
                        returnTuple.wwan.received += (networkData?.pointee.ifi_ibytes)!
                    }
                }
            }
        }
            catch let error {
                print(" A")
            }
        
            freeifaddrs(interfaceAddresses)
        }
        
        return returnTuple
    }*/
}


/*
struct DataUsageInfo {
    var wifiReceived: UInt32 = 0
    var wifiSent: UInt32 = 0
    var wirelessWanDataReceived: UInt32 = 0
    var wirelessWanDataSent: UInt32 = 0
    
    mutating func updateInfoByAdding(info: DataUsageInfo) {
        wifiSent += info.wifiSent
        wifiReceived += info.wifiReceived
        wirelessWanDataSent += info.wirelessWanDataSent
        wirelessWanDataReceived += info.wirelessWanDataReceived
    }
}
*/

/*
class DataUsage {
    
    private static let wwanInterfacePrefix = "pdp_ip"
    private static let wifiInterfacePrefix = "en"
    
    class func getDataUsage() -> DataUsageInfo {
        var interfaceAddresses: UnsafeMutablePointer<ifaddrs>? = nil
        var dataUsageInfo = DataUsageInfo()
        
        guard getifaddrs(&interfaceAddresses) == 0 else { return dataUsageInfo }
        
        var pointer = interfaceAddresses
        while pointer != nil {
            guard let info = getDataUsageInfo(from: pointer!) else {
                pointer = pointer?.pointee.ifa_next
                continue
            }
            dataUsageInfo.updateInfoByAdding(info: info)
            pointer = pointer?.pointee.ifa_next
        }
        
        freeifaddrs(interfaceAddresses)
        
        return dataUsageInfo
    }
    
    private class func getDataUsageInfo(from infoPointer: UnsafeMutablePointer<ifaddrs>) -> DataUsageInfo? {
        let pointer = infoPointer
        
        let name: String! = String.fromCString(infoPointer.pointee.ifa_name)
        
        let addr = pointer.pointee.ifa_addr.pointee
        guard addr.sa_family == UInt8(AF_LINK) else { return nil }
        
        return dataUsageInfo(from: pointer, name: name)
    }
    
    private class func dataUsageInfo(from pointer: UnsafeMutablePointer<ifaddrs>, name: String) -> DataUsageInfo {
        var networkData: UnsafeMutablePointer<if_data>? = nil
        var dataUsageInfo = DataUsageInfo()
        
        if name.hasPrefix(wifiInterfacePrefix) {
            networkData = unsafeBitCast(pointer.pointee.ifa_data, to: UnsafeMutablePointer<if_data>.self)
            dataUsageInfo.wifiSent += (networkData?.memory.ifi_obytes)!
            dataUsageInfo.wifiReceived += (networkData?.memory.ifi_ibytes)!
        } else if name.hasPrefix(wwanInterfacePrefix) {
            networkData = unsafeBitCast(pointer.memory.ifa_data, to: UnsafeMutablePointer<if_data>.self)
            dataUsageInfo.wirelessWanDataSent += networkData?.memory.ifi_obytes
            dataUsageInfo.wirelessWanDataReceived += networkData?.memory.ifi_ibytes
        }
        
        return dataUsageInfo
    }
 
}*/

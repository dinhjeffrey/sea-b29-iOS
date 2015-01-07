//
//  ViewController.swift
//  TweetFellows
//
//  Created by Bradley Johnson on 1/5/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  var tweets = [Tweet]()
  let networkController = NetworkController()

  func doSomething() -> String {
    return "Brad"
  }
   override func viewDidLoad() {
    super.viewDidLoad()
    
    //    if let jsonPath = NSBundle.mainBundle().pathForResource("tweet", ofType: "json") {
    
//      if let jsonData = NSData(contentsOfFile: jsonPath) {
//        var error : NSError?
//        if let jsonArray = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error:&error) as? [AnyObject] {
//    
//          for object in jsonArray {
//            if let jsonDictionary = object as? [String : AnyObject] {
//              let tweet = Tweet(jsonDictionary)
//              self.tweets.append(tweet)
//            }
//          }
//        }
//      } else {
//        println("getting data from path failed")
//      }
    //}
    println(self.tweets.count)
    self.tableView.dataSource = self
    
    self.networkController.fetchHomeTimeline { (tweets, errorString) -> () in
      if errorString == nil {
        self.tweets = tweets!
        self.tableView.reloadData()
      } else {
        //show user alert view telling them it didnt work
      }
    
    
    // Do any additional setup after loading the view, typically from a nib.
//    

   
  }
  }
//  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
//    let tweetVC = self.storyboard?.instantiateViewControllerWithIdentifier("TWEET_VC") as UIViewController
//    self.navigationController?.pushViewController(tweetVC, animated: true)
    
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.tweets.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TWEET_CELL", forIndexPath: indexPath) as TweetCell
      //cell.backgroundColor = UIColor.blueColor()
    let tweet = self.tweets[indexPath.row]
    //cell.textLabel?.text = tweet.text
    cell.tweetLabel.text = tweet.text
    if let imageURL = NSURL(string: tweet.imageURL) {
      if let imageData = NSData(contentsOfURL: imageURL) {
      cell.tweetImageView.image = UIImage(data: imageData)
      }
    }
    

    return cell
  }
}


//
//  UserViewController.swift
//  TweetFellows
//
//  Created by Bradley Johnson on 1/9/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITableViewDataSource {
  
  var networkController : NetworkController!
  var userID : String!
  var tweets : [Tweet]?

  @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.tableView.dataSource = self
      self.tableView.estimatedRowHeight = 144
      self.tableView.rowHeight = UITableViewAutomaticDimension
      self.tableView.registerNib(UINib(nibName: "TweetCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "USER_CELL")
      self.networkController.fetchTimelineForUser(self.userID, completionHandler: { (tweets, errorDescription) -> () in
        self.tweets = tweets
        self.tableView.reloadData()
})
        // Do any additional setup after loading the view.
    }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let tweets = self.tweets {
      return tweets.count
    } else {
      return 0
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("USER_CELL", forIndexPath: indexPath) as TweetCell
    let tweet = self.tweets![indexPath.row]
    //cell.textLabel?.text = tweet.text
    cell.tweetLabel.text = tweet.text
    cell.usernameLabel.text = tweet.username
    if tweet.image == nil {
      self.networkController.fetchImageForTweet(tweet, completionHandler: { (image) -> () in
        //        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        cell.tweetImageView.image = tweet.image
      })
    } else {
      cell.tweetImageView.image = tweet.image
    }

    return cell
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

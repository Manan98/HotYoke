//
//  LoggedinViewController.swift
//  BrickHacks
//
//  Created by Mac2 on 2/11/17.
//  Copyright © 2017 org.cuappdev.project2. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class LoggedinViewController: UIViewController, MCBrowserViewControllerDelegate, MCSessionDelegate  {
    
    var username: String = ""
    var password: String = ""
    
    
    /*
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, username: String, password: String) {
        self.username = username
        self.password = password
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
 
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    
    let serviceType = "LCOC-Chat"
    
    var browser : MCBrowserViewController!
    var assistant : MCAdvertiserAssistant!
    var session : MCSession!
    var peerID: MCPeerID!
    
    var sendButton: UIButton!
    var browseButton: UIButton!
    var login: UIButton!
    
    var messageField: UITextField!
    var chatView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        self.peerID = MCPeerID(displayName: UIDevice.current.name)
        self.session = MCSession(peer: peerID)
        self.session.delegate = self
        
        // create the browser viewcontroller with a unique service name
        self.browser = MCBrowserViewController(serviceType:serviceType,
                                               session:self.session)
        
        self.browser.delegate = self;
        
        self.assistant = MCAdvertiserAssistant(serviceType:serviceType,
                                               discoveryInfo:nil, session:self.session)
        
        // tell the assistant to start advertising our fabulous chat
        self.assistant.start()
        
        sendButton = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.2, width: view.frame.width / 2.0, height: 50))
        sendButton.center = CGPoint(x: view.center.x, y: sendButton.center.y-20)
        //providerButton.setTitle("Provider", for: .normal)
        sendButton.setTitle("Send", for: .normal)
        //providerButton.currentTitle?.write(to: "Provider")
        
        sendButton.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: .normal)
        sendButton.setTitleColor(.lightGray, for: .highlighted)
        sendButton.addTarget(self, action: #selector(sendChat), for: .touchUpInside)
        sendButton.titleLabel!.font = UIFont(name: "Consolas", size: 20)
        sendButton.titleLabel!.adjustsFontSizeToFitWidth = true
        
        
        messageField = UITextField(frame: CGRect(x: 0, y: view.frame.height / 3.0, width: view.frame.width / 2.0, height: 100))
        messageField.center = CGPoint(x: view.center.x, y: messageField.center.y)
        messageField.font = UIFont.systemFont(ofSize: 15)
        messageField.textAlignment = .center
        messageField.textColor = .black
        messageField.backgroundColor = .yellow
        
        chatView = UITextView(frame: CGRect(x: 0, y: view.frame.height / 1.7, width: view.frame.width / 2.0, height: 100))
        chatView.center = CGPoint(x: view.center.x, y: chatView.center.y)
        chatView.textAlignment = .center
        chatView.textColor = .black
        chatView.backgroundColor = .yellow
        
        
        browseButton = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.8, width: view.frame.width / 2.0, height: 50))
        browseButton.center = CGPoint(x: view.center.x, y: browseButton.center.y)
        browseButton.setTitle("Browse", for: .normal)
        browseButton.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: .normal)
        browseButton.setTitleColor(.lightGray, for: .highlighted)
        browseButton.addTarget(self, action: #selector(showBrowser), for: .touchUpInside)
        
        login = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.87, width: view.frame.width / 2.0, height: 50))
        login.center = CGPoint(x: view.center.x, y: login.center.y)
        login.setTitle("Login", for: .normal)
        login.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: .normal)
        login.setTitleColor(.lightGray, for: .highlighted)
        login.addTarget(self, action: #selector(Signin), for: .touchUpInside)
        
        view.addSubview(login)
        view.addSubview(browseButton)
        view.addSubview(chatView)
        view.addSubview(messageField)
        view.addSubview(sendButton)
        
        
    }
    
    func Signin() {
        //redirect
        navigationController?.pushViewController(UserLoginViewController(), animated: true)
    }
    
    func sendChat() {
        // Bundle up the text in the message field, and send it off to all
        // connected peers
        
        messageField.resignFirstResponder()
        chatView.resignFirstResponder()
        
        let msg = self.messageField.text?.data(using: String.Encoding.utf8,
                                               allowLossyConversion: false)
        
        //var error : NSError?
        do {
            try session.send(msg!, toPeers: session.connectedPeers, with: .unreliable)
        } catch let error as NSError {
            print("Error sending data: \(error.localizedDescription)")
        }
        //self.session.send(msg!, toPeers: self.session.connectedPeers,
        //                  with: MCSessionSendDataMode.unreliable, error: &error)
        
        //if error != nil {
        //   print("Error sending data: \(error?.localizedDescription)")
        //}
        
        self.updateChat(text: self.messageField.text!, fromPeer: self.peerID)
        
        self.messageField.text = ""
    }
    
    func updateChat(text : String, fromPeer peerID: MCPeerID) {
        // Appends some text to the chat view
        
        // If this peer ID is the local device's peer ID, then show the name
        // as "Me"
        var name : String
        
        switch peerID {
        case self.peerID:
            name = "Me"
        default:
            name = peerID.displayName
        }
        
        // Add the name to the message and display it
        let message = "\(name): \(text)\n"
        self.chatView.text = self.chatView.text + message
        
    }
    
    func showBrowser() {
        // Show the browser view controller
        self.present(self.browser, animated: true, completion: nil)
    }
    
    func browserViewControllerDidFinish(
        _ browserViewController: MCBrowserViewController)  {
        // Called when the browser view controller is dismissed (ie the Done
        // button was tapped)
        
        self.dismiss(animated: true, completion: {})
    }
    
    func browserViewControllerWasCancelled(
        _ browserViewController: MCBrowserViewController)  {
        // Called when the browser view controller is cancelled
        
        self.dismiss(animated: true, completion: {})
    }
    
    
    
    func session(_ session: MCSession, didReceive data: Data,
                 fromPeer peerID: MCPeerID)  {
        // Called when a peer sends an NSData to us
        
        // This needs to run on the main queue
        DispatchQueue.main.async {
            
            let msg = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)
            
            self.updateChat(text: msg as! String, fromPeer: peerID)
        }
    }
    
    
    // The following methods do nothing, but the MCSessionDelegate protocol
    // requires that we implement them.
    func session(_ withsession: MCSession,
                 didStartReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID, with progress: Progress)  {
        
        // Called when a peer starts sending a file to us
    }
    
    func session(_ session: MCSession,
                 didFinishReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID,
                 at localURL: URL, withError error: Error?)  {
        // Called when a file has finished transferring from another peer
    }
    
    func session(_ didReceivesession: MCSession, didReceive stream: InputStream,
                 withName streamName: String, fromPeer peerID: MCPeerID)  {
        // Called when a peer establishes a stream with us
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID,
                 didChange state: MCSessionState)  {
        // Called when a connected peer changes state (for example, goes offline)
        
    }
    
}

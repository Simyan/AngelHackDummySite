//
//  ViewController.swift
//  AngelHack
//
//  Created by Samia Ahmad on 5/10/17.
//  Copyright © 2017 Samia Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let myChirp = ChirpSDK();
    let chirp = Chirp()
    var err: NSError = NSError()
    @IBOutlet var textArea: UITextView!
   // let alert = AudioAlertPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let isOk: Bool
      
    //   myChirp.setAppKey("mrepHsIsKKoGANMk3Gb5FkvPO", andSecret: "mgb84LV1s6VEKtJdAlGL3rcjpkIa4WA9OSbSfqxWsYclhiDXOC")
        myChirp.setAppKey("mrepHsIsKKoGANMk3Gb5FkvPO", andSecret: "mgb84LV1s6VEKtJdAlGL3rcjpkIa4WA9OSbSfqxWsYclhiDXOC") { ( isOk, error) in
            if(error != nil)
            {print(error)}
            else if (isOk)
            {
                print("yay")
                
            }
        }
        
        
        //myChirp.setProtocolNamed(ChirpProtocolNameUltrasonic)
        
        myChirp.setProtocolNamed(ChirpProtocolNameStandard)
        myChirp.start()
        _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.sayHello), userInfo: nil, repeats: true)
        
        //myChirp.volume = 0.5;
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func sayHello(){
        myChirp.setChirpHeardBlock { (birdy, error) in
            if(birdy == nil) {
                print ("you are a useless piece of shit")
            }
            else {
                print ("praise the lord")
                birdy?.fetchAssociatedData(completion: { (birdy, error) in
                    if (birdy != nil){
                        print("Raam Raam Raam Raam Raam")
                       // let data: NSDictionary = birdy?.data as! NSDictionary
                        let returnData = birdy?.data as! NSDictionary as! [String: AnyObject] as! [String : NSObject]
                        
                        print (returnData)
                        let dumdum = String(describing: returnData)
 
                        //let text: NSString = NSString(data: data, encoding: String.Encoding.utf8)
                        print("Bismillah")
                        print("Subhanallah")
                        print("Mashallah")
                       // print(data)
                            
                        
                        self.textArea.text = dumdum
                    }
                    
                })
            }
        }
        
       // print ("this")
      /*  myChirp.setChirpHeardBlock { (echirp, error) in
            self.chirp.fetchAssociatedData(completion: { (chirp, error) in
                let c_data: NSData = chirp?.dictionaryWithValues(forKeys: ["name"])
                let c_string = NSString(data: c_data!, encoding: String.Encoding.utf8)
                print("decoding....")
                print (c_string);
            })
        }*/
        /*
        myChirp.setChirpHeardBlock { (chirp, error) in
            print("Heard ze chirp")
            chirp?.fetchAssociatedData(completion: { (chirp, error) in
                print("Got ze associated data")
            })
        }*/
        
        

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    @IBAction func decodeTapped(_ sender: Any) {
        
        let blah = Chirp(array: [9, "dumbum"])

        myChirp.setChirpHeardBlock { (birdy, error) in
            if(birdy == nil) {
                print ("you are a useless piece of shit")
            }
            else {
                print ("praise the lord")
            }
        }
        
        
        
        /*
        let semaphore = DispatchSemaphore(value: 0)
       let str = "{\"name\":\"James\"}";
        let dict = convertToDictionary(text: str)
    print("!")
        
       Chirp.createChirp(withAssociatedData: dict!) { (chirp, error) in
        if(chirp != nil)
        { print(chirp!.shortcode)
            print("print chirp")}
        else
        { print("Nu")}
      
       semaphore.signal()
        }
        
       // if(myChirp.audioEngineState == ChirpNotifications)
         semaphore.wait(timeout: DispatchTime.distantFuture)
        semaphore.resume()
       // print ("here")
       // chirp.chirp()
        
 
        
        
      if (myChirp.audioEngineState != ChirpAudioStateReady)
        {
            print("Audio state ille")
            
        }
        
        //let id = myChirp.randomIdentifier()
        //let id = "0280514023"
 */
        
       // let id = "name"
        /*
        if(!myChirp.isValidChirpIdentifier(id))
        {
            print("Wtf")
        }*/
 
        
      //  let newChirp = Chirp(identifier: id)
        
        /*
        if (myChirp.audioEngineState != ChirpAudioStateReady)
        {
            print("Audio state ille")
            
        }
                let str = "{\"name\":\"James\"}";
        let dict = convertToDictionary(text: str)
        Chirp.createChirp(withAssociatedData: dict!) { (blah, error) in
            if(blah == nil){
                print("life sucks")
            }
            else {
                print ("you are a genius")
                print(blah)
                
                blah?.chirp()
                blah?.startStreaming()
                blah?.stopStreaming()
                blah?.chirp(completion: { (blah, error) in
                    print ("ppppp")
                })
            }
        }
 */
        /*
        Chirp.createChirp(withAssociatedData:  [id: "fuuo"]) { (bird, error) in
            if(bird == nil){
                print("life sucks")
            }
            else {
                print ("you are a genius")
                print(bird)
                //blah?.chirp()
            }

            
        }*/
        /*
        if (blah?.data == nil) {
            print ("STill nill")
        }
        else {
            print("yay not nill")
        }
        */
        
        /*
        if(newChirp == nil) {
            print ("CHIRP BAD")
        }
        

        newChirp?.chirp { (chirp, error) in
            if (error == nil){
                print("YAAAY")
            }
            else{
                print("IN ERROR")
                print(error)
                
             //   print(error)
               // print(chirp?.identifier)
             //   print
            }
        }
    */

    }

}


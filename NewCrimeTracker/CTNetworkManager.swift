//
//  CTNetworkManager.swift
//  NewCrimeTracker
//
//  Created by Alphonso Sensley II on 3/21/20.
//  Copyright © 2020 Alphonso Sensley II. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)


 To read values from URLs:

   let task = URLSession.shared.welcomeTask(with: url) { welcome, response, error in
     if let welcome = welcome {
       ...
     }
   }
   task.resume()

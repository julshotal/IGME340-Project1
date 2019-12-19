//
//  RitaJSRunner.js
//
//  Created by jefferson on 2/9/19.
//  Copyright © 2019 Ima Student. All rights reserved.
//
/*
 JavaScriptCore Links:
 https://www.raywenderlich.com/1227-javascriptcore-tutorial-for-ios-getting-started
 https://stackoverflow.com/questions/47063137/how-can-i-inject-and-use-this-javascript-library-web3-with-javascriptcore
 https://www.appcoda.com/javascriptcore-swift/
 https://stackoverflow.com/questions/37434560/can-i-run-javascript-inside-swift-code
 https://www.lucidchart.com/techblog/2018/02/14/javascriptcore-the-holy-grail-of-cross-platform/
 http://igm.rit.edu/~acjvks/courses/2019-spring/330/demos/text-mangler-1.html
 
 JavaScriptCore Reference:
 https://developer.apple.com/documentation/javascriptcore/jscontext
 https://developer.apple.com/documentation/javascriptcore/jsvalue
 
 
 RiTa Links:
 https://rednoise.org/rita/
 */

import Foundation
import JavaScriptCore


class RitaJSRunner{
    let pathToRita = "rita-full"
    let pathToMyScripts = "my-scripts"
    // 1 - JSContext is an environment for running JavaScript code - it represents the global object in the environment - and is analagous to the `window` object of a web browser
    let context = JSContext()!
    
    init(){
        // 2 - we can see JS errors inside of this exception handler
        context.exceptionHandler = { context, value in
            print("JSError: \(value!)")
        }
        // 3 - get path to RiTaJS library in our main bundle
        var path = Bundle.main.path(forResource: pathToRita, ofType: "js")!
        
        // 4 - Load RiTaJS contents to a String variable
        var jsSource = try! String(contentsOfFile: path)
        
        // 5 - add the JS code in rita-full.js to the JSContext runtime
        context.evaluateScript(jsSource)
        // now we can call all of the RiTaJS functions!


        // 8 - but more usefully, we can load our own JS scripts
        path = Bundle.main.path(forResource: pathToMyScripts, ofType: "js")!
        jsSource = try! String(contentsOfFile: path)
        context.evaluateScript(jsSource)
    }
    
    
    //call get syllables from the scripts file (in Methods)
    func callJSsyllables(word:String)->String{
        let syllables = context.objectForKeyedSubscript("syllables")
        return syllables?.call(withArguments: [word])?.toString() ?? ""
    }
    
}
    
    


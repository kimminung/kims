//
//  UIDeviceExtension.swift
//  UIDeviceExample
//
//  Created by giftbot on 2018. 2. 5..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

extension UIDevice {
  var isIPhoneX: Bool {
    return UIScreen.main.nativeBounds.height / UIScreen.main.nativeScale == 812
  }
  var isIPhone: Bool {
    return UIDevice.current.userInterfaceIdiom == .phone
  }

  var modelIdentifier: String {
    var sysinfo = utsname()     //UTSname
    uname(&sysinfo)                                         //네임 렝스
    let data = Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN))//네임의 길이만큼 카운트
    let identifier = String(bytes: data, encoding: .ascii)!
    return identifier.trimmingCharacters(in: .controlCharacters)
  }

  var modelName: String {
    return deviceModelMappingList[modelIdentifier] ?? "Unknown"
  }

  var modelNameFromPlist: String {
    let deviceListPath = Bundle.main.path(forResource: "iOSDeviceMapping", ofType: "plist")!
    let deviceList = NSDictionary(contentsOfFile: deviceListPath)!
    return (deviceList[modelIdentifier] as? String) ?? "Unknown"
  }

  var simulatorModelName: String {  //시뮬레이터에서도 정확하게 모델네임 설정
    let env = ProcessInfo.processInfo.environment
    guard let name = env["SIMULATOR_DEVICE_NAME"] else { return "No Simulator" }
        let identifier = env["SIMULATOR_MODEL_IDENTIFIER"]
        let runtime = env["SIMULATOR_RUNTIME_VERSION"]
    return name
  }

  private var deviceModelMappingList: [String: String] {//매년 기종의 새로운점 관리해줘야함(검색)
    return [
      "iPhone1,1" : "iPhone",            // (Original)
      "iPhone1,2" : "iPhone",            // (3G)
      "iPhone2,1" : "iPhone",            // (3GS)
      "iPhone3,1" : "iPhone 4",          // (GSM)
      "iPhone3,3" : "iPhone 4",          // (CDMA)
      "iPhone4,1" : "iPhone 4S",         //
      "iPhone5,1" : "iPhone 5",          // (A1428)
      "iPhone5,2" : "iPhone 5",          // (A1429)
      "iPhone5,3" : "iPhone 5c",         // (A1456/A1532)
      "iPhone5,4" : "iPhone 5c",         // (A1507/A1516/A1529)
      "iPhone6,1" : "iPhone 5s",         // (A1433, A1453)
      "iPhone6,2" : "iPhone 5s",         // (A1457, A1518, A1530)
      "iPhone7,1" : "iPhone 6 Plus",     //
      "iPhone7,2" : "iPhone 6",          //
      "iPhone8,1" : "iPhone 6S",         //
      "iPhone8,2" : "iPhone 6S Plus",    //
      "iPhone8,4" : "iPhone SE",         //
      "iPhone9,1" : "iPhone 7",          // (A1660/A1779/A1780)
      "iPhone9,3" : "iPhone 7",          // (A1778)
      "iPhone9,2" : "iPhone 7 Plus",     // (A1661/A1785/A1786)
      "iPhone9,4" : "iPhone 7 Plus",     // (A1784)
      "iPhone10,1": "iPhone 8",          // (A1863/A1906) CDMA
      "iPhone10,4": "iPhone 8",          // (A1905) GSM
      "iPhone10,2": "iPhone 8 Plus",     // (A1864/A1898) CDMA
      "iPhone10,5": "iPhone 8 Plus",     // (A1897) GSM
      "iPhone10,3": "iPhone X",          // (A1865/A1902) CDMA
      "iPhone10,6": "iPhone X",          // (A1901) GSM
//    "iPhone10,7": "iPhone XI",          // (AXXX) <- 이런식으로 추가하던지 내부 변경사항 업뎃

      "iPad1,1"   : "iPad",              // (Original)
      "iPad2,1"   : "iPad 2",            // (Wi-Fi)
      "iPad2,2"   : "iPad 2",            // (GSM)
      "iPad2,3"   : "iPad 2",            // (CDMA)
      "iPad2,4"   : "iPad 2",            // (Wi-Fi, revised)
      "iPad2,5"   : "iPad Mini",         // (Wi-Fi)
      "iPad2,6"   : "iPad Mini",         // (A1454)
      "iPad2,7"   : "iPad Mini",         // (A1455)
      "iPad3,1"   : "iPad 3",            // (3rd Generation, Wi-Fi)
      "iPad3,2"   : "iPad 3",            // (3rd Generation, Wi-Fi+LTE Verizon)
      "iPad3,3"   : "iPad 3",            // (3rd Generation, Wi-Fi+LTE AT&T)
      "iPad3,4"   : "iPad 4",            // (4th Generation, Wi-Fi)
      "iPad3,5"   : "iPad 4",            // (4th Generation, A1459)
      "iPad3,6"   : "iPad 4",            // (4th Generation, A1460)
      "iPad4,1"   : "iPad Air",          // (Wifi)
      "iPad4,2"   : "iPad Air",          // (Wi-Fi+LTE)
      "iPad4,3"   : "iPad Air",          // (Rev)
      "iPad4,4"   : "iPad Mini 2",       // (2nd Generation, Wifi)
      "iPad4,5"   : "iPad Mini 2",       // (2nd Generation, Wi-Fi+LTE)
      "iPad4,6"   : "iPad Mini 2",       // (2nd Generation, Rev)
      "iPad4,7"   : "iPad Mini 3",       // (3rd Generation, Wifi, A1599)
      "iPad4,8"   : "iPad Mini 3",       // (3rd Generation, A1600)
      "iPad4,9"   : "iPad Mini 3",       // (3rd Generation, A1601)
      "iPad5,1"   : "iPad Mini 4",       // (Wi-Fi)
      "iPad5,2"   : "iPad Mini 4",       // (Wi-Fi+LTE)
      "iPad5,3"   : "iPad Air 2",        // (Wi-Fi)
      "iPad5,4"   : "iPad Air 2",        // (Wi-Fi+LTE)
      "iPad6,3"   : "iPad Pro (9.7 inch)",  // (Wi-Fi)
      "iPad6,4"   : "iPad Pro (9.7 inch)",  // (Wi-Fi+LTE)
      "iPad6,7"   : "iPad Pro (12.9 inch)", // (Wi-Fi)
      "iPad6,8"   : "iPad Pro (12.9 inch)", // (Wi-Fi+LTE)
      "iPad6,11"  : "iPad (9.7 inch)",      // 5th Gen (Wi-Fi)
      "iPad6,12"  : "iPad (9.7 inch)",      // 5th Gen (Wi-Fi+LTE)
      "iPad7,3"   : "iPad Pro (10.5 inch)", // (A1701)
      "iPad7,4"   : "iPad Pro (10.5 inch)", // (A1709)

      "iPod1,1"   : "iPod Touch",        // (Original)
      "iPod2,1"   : "iPod Touch 2",      // (2nd Generation)
      "iPod3,1"   : "iPod Touch 3",      // (3rd Generation)
      "iPod4,1"   : "iPod Touch 4",      // (4th Generation)
      "iPod5,1"   : "iPod Touch 5",      // (5th Generation)
      "iPod7,1"   : "iPod Touch 6",      // (6th Generation)

      "i386"      : "Simulator",         // 32 bit
      "x86_64"    : "Simulator",         // 64 bit
    ]
  }
}


//
//  ContentView.swift
//  LocalizedStringManagementWithStringsdictFileExplorer
//
//  Created by Kennedy Karimi on 13/08/2024.
//

import SwiftUI

/*
 Pluralization is the process of adapting a word or phrase to reflect the quantity it describes.
 
 A .stringsdict file is essentially a property list(plist) file where each key is a string and its value is a dictionary containing localization information.
 
 The introduction of stringsdict files brought a significant improvement for Swift localization, which primarily addressed the problems of pluralization. The main cause is that plurals of languages are formed differently, and what might be effective for English might not be for other languages such as Russian or Arabic.

 Before the stringsdict introduction, it was very difficult to manage them. stringsdict enables programmers to determine rules for the categories like “one”, “few”, “many” and “other”, which ensure the same level of correctness in translation across languages.
 */

/* Example: Pluralization: Basic Structure:
 {
   "key" = { //Identifier used in code to access the localized string.
     "NSStringLocalizedFormatKey" = "%#@count@" or "The price is %d" //Defines the format string. %#@count@ indicates pluralization will be used, in which case a dictionary with a corresponding variable(count) has to be defined to define the output of each pluralization case. If %#@count@ isn't used and an ordinary string with a format specifier e.g. %d is, then that string will be the output with the format specifier replaced with the provided value.
     "NSStringFormatSpecifiers" = ( //An array of format specifiers (e.g., %d, %@). Optional if NSStringLocalizedFormatKey is defined.
       "%d"
     );
     "NSStringPluralRuleType" = "ordinal"; //Optional. Indicates whether the plural rule is ordinal(1st, 2nd) or cardinal(1, 2)
    "count" = { //Variable used in NSStringLocalizedFormatKey. Mandatory if %#@count@ is the NSStringLocalizedFormatKey.
        "NSStringFormatSpecTypeKey" = "NSStringPluralRuleType"; //Mandatory.  indicates that the count variable is a plural rule.
        "NSStringFormatValueTypeKey" = "d" //Specifies the data type of the count variable as an integer (d), object/string(@), floating-point(f) etc.
        "one" = "You have 1 item."; //Localized strings for different plural forms.
        "other" = "You have %d items."; //Localized strings for different plural forms.
        NB: Both one and other provide pluralization rules for the count variable.
     }
   };
 }
 
 Example: No Pluralization Basic Structure:
 "key" = { //Identifier used in code to access the localized string.
   "NSStringLocalizedFormatKey" = "The price is %d" //Defines the format string. String will be the output with the format specifier replaced with the provided value.
   "NSStringFormatSpecifiers" = ( //Optional. An array of format specifiers (e.g., %d, %@). Optional if NSStringLocalizedFormatKey is defined.
     "%d"
   );
 };
}
 
 
 Note: While .stringsdict files are often associated with complex formatting and pluralization, they can also be used for straightforward translations. Example:
     {
       "greeting" = "Hello, world!";
     }
 */

/* Format Specifiers:
 %d: Integer
 %@: Object (typically a string)
 %f: Floating-point number
 %.2f: Floating-point number with two decimal places
 */

//Fore more: https://hackernoon.com/evolution-of-localization-in-swift-from-strings-to-string-catalogs
//https://www.hackingwithswift.com/example-code/strings/how-to-display-different-strings-based-on-available-space-using-variantfittingpresentationwidth
//https://stackoverflow.com/questions/30144686/ios-stringsdict-not-working
//https://stackoverflow.com/questions/67951828/swiftui-text-view-not-using-localized-stringsdict-file

///Localizable.stringsdict

struct ContentView: View {
    let count = 3 //%d means an Int is expected
    let price = 100 //will be used to calculate an Int value which will be concatenated into the expected datatype which is a string(%@)
    let currency = "USD" //%@ means a string is expected.
    let slices = 4.5 //%f
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(NSLocalizedString("greeting_message", comment: "")) //Using NSLocalizedString. This function is similar to androids getResources(getString(R.string.resource_name))
            Button {
                
            } label: {
                Text(NSLocalizedString("cancel_button", comment: ""))
            }
            Button {
                
            } label: {
                Text(Bundle.main.localizedString(forKey: "save_button", value: nil, table: nil)) //Using Bundle and localizedString(forKey:value:table:)
            }
            Text(Bundle.main.localizedString(forKey: "goodbye_message", value: nil, table: nil))
            
            Text(NSLocalizedString("numberOfSongs", comment: ""))
            Text(String(format: NSLocalizedString("numberOfSongs", comment: ""), count))
            
            Text(NSLocalizedString("numberOfItems", comment: ""))
            Text(String(format: NSLocalizedString("numberOfItems", comment: ""), count, "KES. \(price * count)"))
            
            Text(NSLocalizedString("currency", comment: ""))
            Text(String(format: NSLocalizedString("currency", comment: ""), currency))
            
            Text(NSLocalizedString("bread", comment: ""))
            Text(String(format: NSLocalizedString("bread", comment: ""), slices))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

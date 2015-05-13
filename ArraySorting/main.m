//
//  main.m
//  ArraySorting
//
//  Created by Alain  on 2015-05-12.
//  Copyright (c) 2015 Alain . All rights reserved.
//

#import <Foundation/Foundation.h>

int main(){
    
    NSArray *myarray = @[@"eeeeeAAbfdf",
                         @"Everything",
                         @"news to me",
                         @"timepiece",
                         @"egg",
                         @"eggs",
                         @"paper",
                         @"e",
                         @"facebook",
                         @"painting",
                         @"231 thurlow st",
                         @"99 bottles",];
    
//  works but off the internet:  NSArray *sortedArray = [myarray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

    NSArray *sortedArray = [myarray sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 caseInsensitiveCompare:obj2];
    }];
    
    NSLog(@"The alphabetical array should be: %@", sortedArray);
    

    NSArray *sortedArray2 = [myarray sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        //NSComparisonResult result = NSOrderedSame; //one option is making the default that they're equal, putting return result at the end...does not require an else statement
        
        if (obj1.length > obj2.length){
        return NSOrderedDescending;
        }else if (obj1.length < obj2.length){
            return NSOrderedAscending;
        }else{
        return NSOrderedSame;
        }
    }];
    
     NSLog(@"The order of the array in string length should be: %@", sortedArray2);
  
    NSArray *sortedArray3 = [myarray sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2){
        
        NSString* lastLetter = [obj1 substringFromIndex:obj1.length -1]; // substringFromIndex like character at index
        NSString* lastLetter2 = [obj2 substringFromIndex:obj2.length -1];
        
        return [lastLetter caseInsensitiveCompare:lastLetter2];
    }];
    
    NSLog(@"The array in alphabetical order of the last letter is %@", sortedArray3);
    
// IF YOU WOULD WANT TO REUSE THE ABOVE BLOCK OF CODE, WRITE IT LIKE THIS
//
//    NSComparator comp = ^NSComparisonResult(NSString *obj1, NSString *obj2){
//        
//        NSString* lastLetter = [obj1 substringFromIndex:obj1.length -1]; // it's like character at index
//        NSString* lastLetter2 = [obj2 substringFromIndex:obj2.length -1];
//        
//        return [lastLetter caseInsensitiveCompare:lastLetter2];
//    };
//    
//    NSArray *sortedArray3 = [myarray sortedArrayUsingComparator:comp];
    
    
    // NSString *obj1 below because you know the array is composed of strings...could use id if you didn't know what was in it
    
   
    
    NSArray *sortedArray4 = [myarray sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2){
        
        NSMutableString *obj1Mutable = [obj1 mutableCopy];
        NSMutableString *obj2Mutable = [obj2 mutableCopy];
        
        NSInteger string1ECount = [obj1Mutable replaceOccurrencesOfString:@"e"
                                                              withString:@"thisCanSayAnything"
                                                                 options:NSLiteralSearch
                                                                   range:NSMakeRange(0, obj1.length)];
        NSInteger string2ECount = [obj2Mutable replaceOccurrencesOfString:@"e"
                                                              withString:@"itReallyCan"
                                                                 options:NSLiteralSearch
                                                                   range:NSMakeRange(0, obj2.length)];
        
        if (string1ECount > string2ECount){
            return NSOrderedAscending;
        }else if (string1ECount < string2ECount){
            return NSOrderedDescending;
        }else{
            return NSOrderedSame;
        }
    
        
    }];
    
    NSLog(@"The array in order of most E's looks like %@", sortedArray4);
    
        
    
                             

//  the for loop saves you the trouble of doing:  NSLog(@"%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", myarray[0], myarray[1], myarray[2], myarray[3], myarray[4], myarray[5], myarray[6], myarray[7], myarray[8], myarray[9], myarray[10], myarray[11]);

//   for (int i=0; i<sortedArray.count; i++) {
//       NSLog(@"%@", sortedArray[i]);
//    }
    
// but even the for loop is not necessary as we can simply do  NSLog(@"The alphabetical array should be: %@", sortedArray2); and NSLog the entire array

  return 0;

}

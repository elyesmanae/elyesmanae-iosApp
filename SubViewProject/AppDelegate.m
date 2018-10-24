//
//  AppDelegate.m
//  SubViewProject
//
//  Created by Elzes on 31.08.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CompanyViewController.h"
#import "MapViewController.h"
#import "CompanyViewDetail.h"
#import "PdfViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize tabBars, managedObjectModel = _managedObjectModel, managedObjectContext = _managedObjectContext, persistentStoreCoordinator = _persistentStoreCoordinator;

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   
    tabBars = [[UITabBarController alloc] init];
    NSMutableArray *arrayView = [[NSMutableArray alloc] initWithCapacity:4];
    
    self.window.rootViewController = tabBars;
    self.window.backgroundColor = [UIColor whiteColor];
   
    
    ViewController *view =  [[ViewController alloc] init];
    view.tabBarItem.title = @"Cities";
    view.tabBarItem.image = [UIImage imageNamed:@"bank.png"];
    
    CompanyViewController *companyView = [[CompanyViewController alloc] init];
    companyView.tabBarItem.title = @"Companies";
    companyView.tabBarItem.image = [UIImage imageNamed:@"bar-chart.png"];
    
    MapViewController *mapView =[[MapViewController alloc] init];
    mapView.tabBarItem.title = @"Map";
    mapView.tabBarItem.image = [UIImage imageNamed:@"map-with-placeholder.png"];
    
    PdfViewController *pdfView = [[PdfViewController alloc] init];
    pdfView.tabBarItem.title = @"Pdf";
    pdfView.tabBarItem.image = [UIImage imageNamed:@"pdf.png"];
    
    CompanyViewDetail *cdetail = [[CompanyViewDetail alloc] init];
    
    
    [arrayView addObject:view];
    [arrayView addObject:companyView];
    [arrayView addObject:mapView];
    [arrayView addObject:pdfView];
    [arrayView addObject:cdetail];
    
    
    self.tabBars.viewControllers = arrayView;
    self.tabBars.view.autoresizingMask = (UIViewAutoresizingFlexibleHeight);
    self.window.rootViewController = tabBars;
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


-(void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

    [self saveContext];
    
}

//--Core Data stack


-(NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}




-(NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent storecoordinator for the application. This implementation creates and returns acoordinator, having added the store for the application to it.
            if (_persistentStoreCoordinator != nil) {
                return _persistentStoreCoordinator;
            }
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
 
    NSURL *storeUrl = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"SubViewProject.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading while saving data.";
    if(![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]){
        //Report any error
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize saving data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"Error_Domain" code:1234 userInfo:dict];
        
    }
    return _persistentStoreCoordinator;
}
              


-(NSManagedObjectContext *)managedObjectContext {
    if(_managedObjectContext != nil){
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if(!coordinator){
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

-(NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ModelStore" withExtension:@"momd"];
    
    NSAssert(modelURL, @"Failed to locate mom bundle in application");
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectModel;
}


-(void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if(managedObjectContext != nil) {
            NSError *error = nil;
            if
                ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
                    NSLog(@"Unresolvederror %@, %@", error, [error userInfo]);
    abort();
            }
                }
    
    
    }



@end

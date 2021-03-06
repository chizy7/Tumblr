//
//  PhotosViewController.m
//  Tumblr
//
//  Created by Chizaram Chibueze on 5/17/22.
//

#import "PhotosViewController.h"

@interface PhotosViewController ()
@property (strong, nonatomic) NSArray *posts;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:@"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"];
     NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
     NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
     NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         if (error != nil) {
             NSLog(@"%@", [error localizedDescription]);
         }
         else {
             NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

             // TODO: Get the posts and store in posts property
             // TODO: Reload the table view
             // Get the dictionary from the response key
             NSDictionary *responseDictionary = dataDictionary[@"response"];
             // Store the returned array of dictionaries in our posts property
             self.posts = responseDictionary[@"posts"];
             NSLog(@"Post");
             NSLog(@"%@", self.posts);
         }
     }];
     [task resume];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

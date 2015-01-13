//
//  ViewController.m
//  aufgabe1
//
//  Created by Felix Jensen on 29.10.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import "SaveContactViewController.h"
#import "AppConstants.h"
#import <AFNetworking/AFNetworking.h>

@interface SaveContactViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblFirstname;
@property (weak, nonatomic) IBOutlet UILabel *lblLastname;
@property (weak, nonatomic) IBOutlet UILabel *lblMail;
@property (weak, nonatomic) IBOutlet UILabel *lblUrl;
@property (weak, nonatomic) IBOutlet UILabel *lblNetworkingFramework;
@property (weak, nonatomic) IBOutlet UIButton *localImageButton;

@end

@implementation SaveContactViewController
- (IBAction)toggleNetworkingFramework:(id)sender {
    if([_toggleNetwork isOn]) {
        _lblNetworkingFramework.text = kAFNetworking;
    } else {
        _lblNetworkingFramework.text = kNSURLSession;
    }
    
}

- (IBAction)clickSave:(id)sender {
    
    [self downloadTaskWithUrl:_contact.image];
    
    if(_contact) {
        _contact.firstname = _fieldFirstname.text;
        _contact.lastname = _fieldLastname.text;
        _contact.mail = _fieldMail.text;
        _contact.image = _fieldUrl.text;
        
        [self.delegate changeContact:_contact];
    } else {
        _contact = [self.delegate saveContact:_fieldFirstname.text withLastname:_fieldLastname.text andMail:_fieldMail.text andUrl:_fieldUrl.text];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lblFirstname.text = NSLocalizedString(kFirstname, nil);
    self.lblLastname.text = NSLocalizedString(kLastname, nil);
    self.lblMail.text = NSLocalizedString(kMail, nil);
    self.lblUrl.text = NSLocalizedString(kUrl, nil);
    [self.localImageButton setTitle:NSLocalizedString(kLocalImage, nil) forState:UIControlStateNormal];
    
    self.navigationItem.title = NSLocalizedString(kContact, nil);
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(clickSave:)];
    
    if (_contact) {
        _fieldFirstname.text = _contact.firstname;
        _fieldLastname.text = _contact.lastname;
        _fieldMail.text = _contact.mail;
        _fieldUrl.text = _contact.image;
        
        [self loadImage:_contact.image];
    }
}

-(void)loadImage:(NSString*)imageUrl {
    if([_toggleNetwork isOn]) { // AFNetworking
        [self loadImageThroughAFNetworkingWithUrl:_contact.image];
    } else { // NSURlSession
        [self downloadTaskWithUrl:_contact.image];
    }
}

-(void)loadImageThroughAFNetworkingWithUrl:(NSString*)imageUrl {
    NSURL *url = [NSURL URLWithString:imageUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        UIImage *image = [UIImage imageWithData:responseObject];
        [_image setImage:image];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [operation start];
}

-(void)downloadTaskWithUrl:(NSString*)url {
    NSURLSessionConfiguration *backgroundConfigObject = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"myBackgroundSessionIdentifier"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:backgroundConfigObject delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURL *fileUrl = [NSURL URLWithString:url];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:fileUrl];
    [downloadTask resume];
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    UIImage* img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:location.absoluteString]]];
    [_image setImage:img];
    
    [session finishTasksAndInvalidate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

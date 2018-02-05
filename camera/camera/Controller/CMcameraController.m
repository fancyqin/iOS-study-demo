//
//  CMcameraController.m
//  camera
//
//  Created by QF on 2018/1/30.
//  Copyright © 2018年 QF. All rights reserved.
//
#import "CMcameraController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <CoreLocation/CoreLocation.h>
#import <Photos/Photos.h>

@interface CMcameraController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong,nonatomic) IBOutlet UIImageView *imgv;
@end

@implementation CMcameraController
UIImagePickerController *_imagePickerController;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.delegate = self;
    _imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    _imagePickerController.allowsEditing = YES;
    
}

- (IBAction)butt:(id)sender{
    
    UIAlertController *alertCtl = [[UIAlertController alloc] init];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
    }];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        [self openCamera];
    }];
    UIAlertAction *photoLib = [UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        [self openPhotoLibrary];
    }];
    
    [alertCtl addAction:cancel];
    [alertCtl addAction:camera];
    [alertCtl addAction:photoLib];
    
    [self presentViewController:alertCtl animated:YES completion:nil];
    
}

- (void)openCamera{
    
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        
        //检查相机权限
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
            //没权限
            UIAlertController *alertNoCamera = [UIAlertController alertControllerWithTitle:@"Oops！😂" message:@"没有相机权限，是否开启相机权限" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //打开设置url
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if([[UIApplication sharedApplication] canOpenURL:url]){
                    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                }
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
            [alertNoCamera addAction:okAction];
            [alertNoCamera addAction:cancelAction];
            [self presentViewController:alertNoCamera animated:YES completion:nil];
            
        }else{
            
            _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:_imagePickerController animated:YES completion:nil];
        }
        
        
    }else{
        
         // 没有相机
        
    }
    
    
    
    
    
    
}

- (void)openPhotoLibrary{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        
        //检查相册权限
        PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
        if(authStatus == PHAuthorizationStatusDenied || authStatus == PHAuthorizationStatusRestricted){
            UIAlertController *alertNoPhoto = [UIAlertController alertControllerWithTitle:@"Oops！😂" message:@"没有相册权限，是否开启相册权限" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //打开设置url
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if([[UIApplication sharedApplication] canOpenURL:url]){
                    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                }
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
            [alertNoPhoto addAction:okAction];
            [alertNoPhoto addAction:cancelAction];
            [self presentViewController:alertNoPhoto animated:YES completion:nil];
            
            
        }else{
            //设置资源来源
            _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            //设置可用的媒体类型
            //允许的视频时长为20秒
            //_imagePickerController.videoMaximumDuration = 20;
            //_imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
            //允许编辑图片
            _imagePickerController.allowsEditing = YES;
            
            [self presentViewController:_imagePickerController animated:YES completion:^{
                NSLog(@"Open photoLibrary");
            }];
        }
        
        
    }else{
        NSLog(@"Cannot open photoLibrary");
    }
}

#pragma mark - UIImagePickerControllerDelegate
//选择图片回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [self dismissViewControllerAnimated:YES completion:nil];
    //  info中可能包含
    //    UIImagePickerControllerCropRect // 编辑裁剪区域
    //    UIImagePickerControllerEditedImage // 编辑后的UIImage
    //    UIImagePickerControllerMediaType // 返回媒体的媒体类型
    //    UIImagePickerControllerOriginalImage // 原始的UIImage
    //    UIImagePickerControllerReferenceURL // 图片地址
    
    self.imgv.image = info[UIImagePickerControllerEditedImage];
    self.imgv.userInteractionEnabled = YES;
    self.imgv.contentMode = UIViewContentModeScaleAspectFit;
    
    if(picker.sourceType == UIImagePickerControllerSourceTypeCamera){
        //图片存入相册
        
        UIImageWriteToSavedPhotosAlbum(info[UIImagePickerControllerOriginalImage], nil, nil, nil);
        
        
    }else{
        NSLog(@"存入相册失败");
    }
    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


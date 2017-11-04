//
//  CertificationVC.m
//  Dream+
//
//  Created by liuke on 2017/11/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CertificationVC.h"
#import "ToolClass.h"
@interface CertificationVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    
    UIImagePickerController *imagePicker;
    UIImage *image;// 头像
}
@property (strong, nonatomic) IBOutlet UITextField *realName;
@property (strong, nonatomic) IBOutlet UITextField *IdNumb;
@property (strong, nonatomic) IBOutlet UIImageView *idImg;

@end

@implementation CertificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _idImg.layer.masksToBounds = YES;
    _idImg.layer.cornerRadius = 10.0f;
    self.title = @"实名认证";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)chooseImg:(UITapGestureRecognizer *)sender {
    
    [self changeHeaderImage];
}
- (IBAction)certification:(UIButton *)sender {
    //认证
    if (_realName.text.length==0) {
        [BMToast makeText:@"姓名为空"];
    }else if (![ ToolClass ValidateIDCard:_IdNumb.text]){
        
        [BMToast makeText:@"身份证号格式不正确"];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark --UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    weakSelf(self);
    [picker dismissViewControllerAnimated:YES completion:^{
        if (image == nil) {
            image = [[UIImage alloc]init];
        }
        image = [info objectForKey:UIImagePickerControllerEditedImage];
        [weakSelf.idImg setImage:image] ;
        
    }];
    
}

//修改图像照片
-(void)changeHeaderImage{
    
    
    if (imagePicker == nil) {
        imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.allowsEditing =YES;
    }
    imagePicker.delegate = self;
    imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    UIAlertController *alt=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *male=[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 从手机相册选择
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;//照片来源为手机相册
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *formale=[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;//照片来源为相机
            [self presentViewController:imagePicker animated:YES completion:nil];
        }else {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"该设备没有照相机" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }];
    
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [cancel setValue:[UIColor redColor] forKey:@"_titleTextColor"];
    [alt addAction:male];
    [alt addAction:formale];
    [alt addAction:cancel];
    [self presentViewController:alt animated:YES completion:nil];
    
}


@end

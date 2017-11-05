//
//  MineInfoViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MineInfoViewController.h"
#import "AddressViewController.h"
#import "PersonDetailModel.h"
#import "LoginVC.h"
@interface MineInfoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    
    UIImagePickerController *imagePicker;
    UIImage *image;// 头像
}
@property (strong, nonatomic) IBOutlet UILabel *nickName;
@property (strong, nonatomic) IBOutlet UILabel *Sex;
@property (strong, nonatomic) IBOutlet UIImageView *headerIcon;
@property (weak, nonatomic) IBOutlet UILabel *vipLevel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNub;
@end

@implementation MineInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.headerIcon.layer.masksToBounds = YES;
    self.headerIcon.layer.cornerRadius = self.headerIcon.width/2;
//    [self getdPersonDetail];
}
#pragma mark --- 个人信息接口
-(void)getdPersonDetail{
    NSMutableDictionary *params =[NSMutableDictionary dictionary];
    params[@"memberId"] = @"1";//会员ID
    
    [[HttpClient sharedInstance]findPersonDetailParams:params CompleteleHandek:^(NSDictionary *data, NSError *error) {
        if (data) {
            PersonDetailModel* model = [PersonDetailModel mj_objectWithKeyValues:data];
            self.nickName.text = model.nickName;
            self.Sex.text = model.sex;
            [self.headerIcon sd_setImageWithURL:[NSURL URLWithString:model.headImg] placeholderImage:[UIImage imageNamed:@""]];
            self.vipLevel.text = model.nickName;;
            self.phoneNub.text = model.cellphone;;
        }
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        [weakSelf.headerIcon setImage:image] ;
        
    }];
    
}
- (IBAction)loginOut:(UIButton *)sender {
    //退出登录
    //此处做消除账户信息操作
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setBool:NO forKey:@"login"];
    [user synchronize];
    LKTabBarController *tabbar = (LKTabBarController *)self.view.window.rootViewController.presentedViewController;
    [tabbar setSelectedIndex:0];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    LKBaseNavController *loginNav=[[LKBaseNavController alloc]initWithRootViewController:[[LoginVC alloc]init]];
    [tabbar presentViewController:loginNav animated:YES completion:nil];
    
    
}
- (IBAction)changeHeaderIcon:(UITapGestureRecognizer *)sender {
    //跟换图片
    [self changeHeaderImage];
    
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


//修改昵称
- (IBAction)fixNickName:(UITapGestureRecognizer *)sender {
    [self pushAlterViewwith:_nickName andTitle:@"修改昵称"];
    
}
    

#pragma mark -- UIal
-(void)pushAlterViewwith:(UILabel*)textLab andTitle:(NSString *)titile{
    UIAlertController *ALT=[UIAlertController alertControllerWithTitle:titile message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancal=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *sure=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *text=(UITextField*)ALT.textFields[0];
        textLab.text=text.text;
        
    }];
    
    [ALT addAction:cancal];
    [ALT addAction:sure];
    [ALT addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text=textLab.text;
    }];
    [self presentViewController:ALT animated:YES completion:nil];
    
    
}
//修改性别

- (IBAction)cahngeSex:(UITapGestureRecognizer *)sender {
    UIAlertController *alt=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *male=[UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _Sex.text=@"男";
    }];
    
    UIAlertAction *formale=[UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _Sex.text=@"女";
    }];
    UIAlertAction *securty=[UIAlertAction actionWithTitle:@"保密" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _Sex.text=@"保密";
    }];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [cancel setValue:[UIColor redColor] forKey:@"_titleTextColor"];
    [alt addAction:male];
    [alt addAction:formale];
    [alt addAction: securty];
    [alt addAction:cancel];
    [self presentViewController:alt animated:YES completion:nil];
    
}
//收货地址
- (IBAction)addressChange:(UITapGestureRecognizer *)sender {
    AddressViewController*  infoVC=[[AddressViewController alloc]init];
    infoVC.navigationItem.title = @"地址管理";
    [self.navigationController pushViewController:infoVC animated:YES];
}



@end

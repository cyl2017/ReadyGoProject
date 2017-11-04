//
//  AddGoodsViewController.m
//  WenDao
//
//  Created by 黄斌 on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AddGoodsVC.h"
#import "HttpClient+Prefecture.h"
#import "BMActionSheet.h"
#import "MBProgressHUD+MJ.h"
#import "GoodsDetailModel.h"

@interface AddGoodsVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>

@property (nonatomic,strong) UIButton *tmpImgBtn;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *image1;
@property (strong, nonatomic) IBOutlet UIButton *image2;
@property (strong, nonatomic) IBOutlet UIButton *image3;
@property (strong, nonatomic) IBOutlet UIButton *image4;
@property (strong, nonatomic) IBOutlet UIButton *image5;
@property (strong, nonatomic) IBOutlet UIButton *image6;

@property (strong, nonatomic) IBOutlet UITextField *productName;
@property (strong, nonatomic) IBOutlet UITextField *productShop;        //所属店铺
@property (strong, nonatomic) IBOutlet UITextField *productNewImg;      //是否新图
@property (strong, nonatomic) IBOutlet UITextField *productType;        //所属类型
@property (strong, nonatomic) IBOutlet UITextField *productParam;
@property (strong, nonatomic) IBOutlet UITextField *inventory;
@property (strong, nonatomic) IBOutlet UITextField *ProductStandard;
@property (strong, nonatomic) IBOutlet UITextField *productPrice;
@property (strong, nonatomic) IBOutlet UITextField *productDesc;
//@property (strong, nonatomic) IBOutlet UITextField *productIntroduction;
@property (strong, nonatomic) IBOutlet UITextView *productIntroduction;

@property (nonatomic, strong) BMSpinnerView *shopView;
@property (nonatomic, strong) BMSpinnerView *imgNewView;
@property (nonatomic, strong) BMSpinnerView *typeView;

@property (nonatomic,strong) GoodsDetailModel *detailModel;

@property (nonatomic,strong) NSArray *productTypeList;
/*
     id = 7;
     img1 = "http://120.76.165.119:8090/static/";
     next = "<null>";
     typeName = "\U94dd\U5408\U91d1\U6750\U6599";
 */

@property (nonatomic,strong) NSArray *imageList;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *uploadImageViewH;

@end

@implementation AddGoodsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

    _productShop.delegate = self;
    _productNewImg.delegate = self;
    _productType.delegate = self;
    
    _productIntroduction.layer.cornerRadius = 10;
    _productIntroduction.layer.masksToBounds = YES;
    
    _imageList = @[_image1,
                   _image2,
                   _image3,
                   _image4,
                   _image5,
                   _image6];
    
    self.shopView = [[BMSpinnerView alloc] init];
//    self.shopView.datas = @[@"普通证件", @"三证合一"];
    
    @weakify(self);
    self.shopView.callback = ^(NSIndexPath *indexPath){
        @strongify(self);
        [self.shopView hideWithAnimate:YES];
        self.productShop.text = self.shopView.datas[indexPath.row];
    };
    
    
    self.imgNewView = [[BMSpinnerView alloc] init];
    self.imgNewView.datas = @[@"是", @"否"];
    self.imgNewView.callback = ^(NSIndexPath *indexPath){
        @strongify(self);
        [self.imgNewView hideWithAnimate:YES];
        self.productNewImg.text = self.imgNewView.datas[indexPath.row];
    };
    
    
    self.typeView = [[BMSpinnerView alloc] init];
    self.typeView.callback = ^(NSIndexPath *indexPath){
        @strongify(self);
        [self.typeView hideWithAnimate:YES];
        self.productType.text = self.typeView.datas[indexPath.row];
    };
    
    UserModel *userInfo = [ToolClass userInfo];
    self.uploadImageViewH.constant = 186 - 60 - 22;
    if (_productId)
    {
        self.title = @"编辑商品";
    }
    else
    {
        self.title = @"添加商品";
        
        for (NSInteger i=1; i<6; ++i) {
            ((UIButton *)_imageList[i]).hidden = YES;
        }
    }
    self.productShop.text = userInfo.shopName;

    [HttpClient postWithParam:@{@"plantId":userInfo.plantId} withUrl:@"productType/getShopProductType" block:^(NSDictionary *result, NSError *error) {
        if (!error) {
            if ([result[@"status"] integerValue] == 0) {
                NSDictionary *data = result[@"data"];
                if (data && [data isKindOfClass:[NSDictionary class]])
                {
                    NSArray *object = data[@"object"];
                    if (object && [object isKindOfClass:[NSArray class]] && object.count > 0)
                    {
                        NSDictionary *objectDict = object[0];
                        
                        NSArray *next = objectDict[@"next"];
                        if (next && [next isKindOfClass:[NSArray class]] && next.count > 0)
                        {
                            _productTypeList = next;
                            NSMutableArray *typeList = @[].mutableCopy;
                            for (NSDictionary *type in next)
                            {
                                [typeList addObject: type[@"typeName"]];
                            }
                            self.typeView.datas = typeList;
                            if (_productId)
                            {
                                [self requestProductDetail];
                            }
                        }
                    }
                }
            }
        }
    }];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == _productShop) {
        return NO;
    } else if (textField == _productNewImg) {
        [self.imgNewView showBelowWith:textField];
        return NO;
    } else if (textField == _productType) {
        if (self.typeView.datas.count == 0) {
            [MBProgressHUD showError:@"暂无商品类型，请在管理平台添加"];
        } else {
            [self.typeView showBelowWith:textField];
        }
        return NO;
    }
    return YES;
}

//获取详情
- (void)requestProductDetail {
    [HttpClient productEdit:@{@"id":self.productId} CompleteleHandek:^(NSDictionary *data, NSError *error) {
        if (!error) {
            _detailModel = [GoodsDetailModel mj_objectWithKeyValues:data[@"object"]];
            if (!isStringEmpty(_detailModel.image)) {
                [self.image1 sd_setImageWithURL:[NSURL URLWithString:_detailModel.image] forState:UIControlStateNormal];
                self.image2.hidden = NO;
                self.image3.hidden = YES;
                self.image4.hidden = YES;
                self.image5.hidden = YES;
                self.image6.hidden = YES;
            }
            
            if (!isStringEmpty(_detailModel.image1)) {
                [self.image2 sd_setImageWithURL:[NSURL URLWithString:_detailModel.image1] forState:UIControlStateNormal];
                self.image3.hidden = NO;
                self.image4.hidden = YES;
                self.image5.hidden = YES;
                self.image6.hidden = YES;
            }
            
            if (!isStringEmpty(_detailModel.image2)) {
                self.uploadImageViewH.constant = 186;
                [self.image3 sd_setImageWithURL:[NSURL URLWithString:_detailModel.image2] forState:UIControlStateNormal];
                self.image4.hidden = NO;
                self.image5.hidden = YES;
                self.image6.hidden = YES;
            }
            
            if (!isStringEmpty(_detailModel.image3)) {
                [self.image4 sd_setImageWithURL:[NSURL URLWithString:_detailModel.image3] forState:UIControlStateNormal];
                self.image5.hidden = NO;
                
            }
            if (!isStringEmpty(_detailModel.image4)) {
                [self.image5 sd_setImageWithURL:[NSURL URLWithString:_detailModel.image4] forState:UIControlStateNormal];
                self.image6.hidden = NO;
            }
            if (!isStringEmpty(_detailModel.image5)) {
                [self.image6 sd_setImageWithURL:[NSURL URLWithString:_detailModel.image5] forState:UIControlStateNormal];
            }
            
            _productName.text = _detailModel.productName;

            if (_detailModel.productsNew) {
                _productNewImg.text = self.imgNewView.datas[0];      //是否新图
            } else {
                _productNewImg.text = self.imgNewView.datas[1] ;      //是否新图
            }
            for (NSDictionary *type in _productTypeList)
            {
                if ([type[@"id"] integerValue]  == _detailModel.type)
                {
                    _productType.text = type[@"typeName"];
                }
            }
            _productParam.text = _detailModel.parameter;
            _inventory.text = _detailModel.stock;
            _ProductStandard.text = _detailModel.specifications;
            _productPrice.text = _detailModel.price;
            _productDesc.text = _detailModel.describe;
            _productIntroduction.text = _detailModel.productIntro;
        }
    }];
}

- (IBAction)saveOnClick:(UIButton *)button
{
    if (_productName.text.length == 0) {
        [MBProgressHUD showError:@"请输入所属名称"];
        return;
    } else if (_productShop.text.length == 0) {
        [MBProgressHUD showError:@"请输入所属店铺"];
        return;
    } else if (_productNewImg.text.length == 0) {
        [MBProgressHUD showError:@"请输入是否新图"];
        return;
    } else if (_productType.text.length == 0) {
        [MBProgressHUD showError:@"请输入所属类型"];
        return;
    }
    
    [self.view endEditing:YES];
    
    if (self.image1.selected || self.image2.selected || self.image3.selected ||
        self.image4.selected || self.image5.selected || self.image6.selected)
    {
        [self uploadsImage];
    }
    else
    {
        if (_productId) {
            [self updateProduct:@[].mutableCopy];
        } else {
            [self addProduct:nil];
        }
    }
}

//图片上传
- (void)uploadsImage
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    UIImage *img1 = [self.image1 imageForState:UIControlStateNormal];
    if (self.image1.selected) [array addObject: UIImagePNGRepresentation(img1)];
    
    UIImage *img2 = [self.image2 imageForState:UIControlStateNormal];
    if (self.image2.selected) [array addObject: UIImagePNGRepresentation(img2)];
    
    UIImage *img3 = [self.image3 imageForState:UIControlStateNormal];
    if (self.image3.selected) [array addObject: UIImagePNGRepresentation(img3)];
    
    UIImage *img4 = [self.image4 imageForState:UIControlStateNormal];
    if (self.image4.selected) [array addObject: UIImagePNGRepresentation(img4)];
    
    UIImage *img5 = [self.image5 imageForState:UIControlStateNormal];
    if (self.image5.selected) [array addObject: UIImagePNGRepresentation(img5)];
    
    UIImage *img6 = [self.image6 imageForState:UIControlStateNormal];
    if (self.image6.selected) [array addObject: UIImagePNGRepresentation(img6)];
    
    [dict setObject:array forKey:@"file"];
    
    [SVProgressHUD showWithStatus:@"上传中"];
    [HttpClient uploadImgs:dict CompleteleHandek:^(NSDictionary *data, NSError *error) {
        if (error) {
            [SVProgressHUD dismiss];
            [MBProgressHUD showError:@"上传失败" toView:self.view];
        } else {
            if ([data[@"status"] integerValue] == 0)
            {
                NSDictionary *listData = data[@"data"];
                if (listData) {
                    NSArray *list = listData[@"list"];
                    if (list && list.count == array.count)
                    {
                        if (_productId) {
                            [self updateProduct:list.mutableCopy];
                        } else {
                            //图片上传成功，调用添加商品的接口
                            [self addProduct:list];
                        }
                    }
                }
            }
            else
            {
                [MBProgressHUD showError:data[@"msg"] toView:self.view];
            }
        }
    }];
}

//添加商品
- (void)addProduct:(NSArray *)list {
    
    UserModel *userModel = [ToolClass userInfo];
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithCapacity:0];
    //厂家ID
    [mutableDict setObject:userModel.plantId forKey:@"plantId"];
    
    if (_productName.text.length > 0)
        [mutableDict setObject:_productName.text forKey:@"productName"];
    
    if (_productPrice.text.length > 0)
        [mutableDict setObject:_productPrice.text forKey:@"price"];
    
    if (_productParam.text.length > 0)
        [mutableDict setObject:_productParam.text forKey:@"parameter"];
    
    if (_inventory.text.length > 0)
        [mutableDict setObject:_inventory.text forKey:@"stock"];
    
    if (_ProductStandard.text.length > 0)
        [mutableDict setObject:_ProductStandard.text forKey:@"specifications"];
    
    if (_productType.text.length > 0)
        [mutableDict setObject:_productTypeList[[self.typeView.datas indexOfObject:_productType.text]][@"id"] forKey:@"type"];
    
    if (_productIntroduction.text.length > 0)
        [mutableDict setObject:_productIntroduction.text forKey:@"productIntro"];
    
    if (_productNewImg.text.length > 0) {
        [mutableDict setObject:@([self.imgNewView.datas indexOfObject:_productNewImg.text]) forKey:@"newProducts"];
    }
    
    if (_productDesc.text.length > 0)
        [mutableDict setObject:_productDesc.text forKey:@"describe"];

    NSInteger count = list.count;
    for (NSInteger i=0; i<count; ++i)
    {
        NSDictionary *dict = list[i];
        NSString *relativePath = dict[@"relativePath"];

        switch (i) {
            case 0:
                [mutableDict setObject:relativePath forKey:@"image"];
                break;
            case 1:
                [mutableDict setObject:relativePath forKey:@"image1"];
                break;
            case 2:
                [mutableDict setObject:relativePath forKey:@"image2"];
                break;
            case 3:
                [mutableDict setObject:relativePath forKey:@"image3"];
                break;
            case 4:
                [mutableDict setObject:relativePath forKey:@"image4"];
                break;
            case 5:
                [mutableDict setObject:relativePath forKey:@"image5"];
                break;
                
            default:
                break;
        }
    }
    
    [HttpClient addProduct:mutableDict CompleteleHandek:^(BMResponse *response, NSError *error)
     {
         if (!error) {
             if (response.status == 0) {
                 [MBProgressHUD showError:@"添加成功"];
                 [self.navigationController popViewControllerAnimated:YES];
             }
         } else {
             [MBProgressHUD showError:@"添加失败"];
         }
     }];
}

//更新商品
- (void)updateProduct:(NSMutableArray *)list
{
    if (_productId) {
        if (_detailModel.image)
        {
            [list addObject:@{@"relativePath":[_detailModel.image stringByReplacingOccurrencesOfString:kRootImageUrl withString:@""]}];
        }
        if (_detailModel.image1)
        {
            [list addObject:@{@"relativePath":[_detailModel.image1 stringByReplacingOccurrencesOfString:kRootImageUrl withString:@""]}];
        }
        if (_detailModel.image2)
        {
            [list addObject:@{@"relativePath":[_detailModel.image2 stringByReplacingOccurrencesOfString:kRootImageUrl withString:@""]}];
        }
        if (_detailModel.image3)
        {
            [list addObject:@{@"relativePath":[_detailModel.image3 stringByReplacingOccurrencesOfString:kRootImageUrl withString:@""]}];
        }
        if (_detailModel.image4)
        {
            [list addObject:@{@"relativePath":[_detailModel.image4 stringByReplacingOccurrencesOfString:kRootImageUrl withString:@""]}];
        }
        if (_detailModel.image5)
        {
            [list addObject:@{@"relativePath":[_detailModel.image5 stringByReplacingOccurrencesOfString:kRootImageUrl withString:@""]}];
        }
    }
    
    UserModel *userModel = [ToolClass userInfo];
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithCapacity:0];
    //厂家ID
    [mutableDict setObject:userModel.plantId forKey:@"plantId"];
    
    [mutableDict setObject:self.productId forKey:@"id"];
    
    if (_productName.text.length > 0)
        [mutableDict setObject:_productName.text forKey:@"productName"];
    
    if (_productPrice.text.length > 0)
        [mutableDict setObject:_productPrice.text forKey:@"price"];
    
    if (_productParam.text.length > 0)
        [mutableDict setObject:_productParam.text forKey:@"parameter"];
    
    if (_inventory.text.length > 0)
        [mutableDict setObject:_inventory.text forKey:@"stock"];
    
    if (_ProductStandard.text.length > 0)
        [mutableDict setObject:_ProductStandard.text forKey:@"specifications"];
    
    if (_productIntroduction.text.length > 0)
        [mutableDict setObject:_productIntroduction.text forKey:@"productIntro"];
    
    if (_productNewImg.text.length > 0) {
        [mutableDict setObject:@([self.imgNewView.datas indexOfObject:_productNewImg.text]) forKey:@"newProducts"];
    }
    
    if (_productType.text.length > 0)
        [mutableDict setObject:_productTypeList[[self.typeView.datas indexOfObject:_productType.text]][@"id"] forKey:@"type"];
    
    if (_productIntroduction.text.length > 0)
        [mutableDict setObject:_productIntroduction.text forKey:@"productIntro"];
    
    if (_productDesc.text.length > 0)
        [mutableDict setObject:_productDesc.text forKey:@"describe"];
    
    NSInteger count = list.count;
    for (NSInteger i=0; i<count; ++i)
    {
        NSDictionary *dict = list[i];
        NSString *relativePath = dict[@"relativePath"];
        
        switch (i) {
            case 0:
                [mutableDict setObject:relativePath forKey:@"image"];
                break;
            case 1:
                [mutableDict setObject:relativePath forKey:@"image1"];
                break;
            case 2:
                [mutableDict setObject:relativePath forKey:@"image2"];
                break;
            case 3:
                [mutableDict setObject:relativePath forKey:@"image3"];
                break;
            case 4:
                [mutableDict setObject:relativePath forKey:@"image4"];
                break;
            case 5:
                [mutableDict setObject:relativePath forKey:@"image5"];
                break;
                
            default:
                break;
        }
    }

    
    [HttpClient updateProduct:mutableDict CompleteleHandek:^(BMResponse *response, NSError *error) {
        if (!error) {
            if (response.status == 0) {
                [self.navigationController popViewControllerAnimated:YES];
            } else {
                
            }
            [MBProgressHUD showError:response.msg];
        }
    }];
}

- (IBAction)userHeaderOnClick:(UIButton *)button
{
    button.selected = YES;
    self.tmpImgBtn = button;
    BMActionSheet *sheet = [[BMActionSheet alloc] initWithArray:@[@"拍照",@"从相册选取"]];
    sheet.color = [UIColor colorWithRed:28/255.0 green:201/255.0 blue:120/255.0 alpha:1];
    sheet.number = 1;
    sheet.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [[UIApplication sharedApplication].keyWindow addSubview:sheet];
    [sheet onClick:^(UIButton *button) {
        if (button) {
            if([[button titleForState:UIControlStateNormal] isEqualToString:@"拍照"]) {
                [self cameraImage];
            } else {
                [self uploadImg];
            }
        }
    }];
}

#pragma mark 拍照
///camera upload image
- (void)cameraImage
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;   //资源类型 相机
    }
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}


///Photo album upload image
- (void)uploadImg
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
    }
    else if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

///Choose the method of picture called when complete picture
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        if (picker.allowsEditing == YES)
        {
            [self.tmpImgBtn setImage:[info objectForKey:UIImagePickerControllerEditedImage] forState:UIControlStateNormal];
        }
        else
        {
            [self.tmpImgBtn setImage:[info objectForKey:UIImagePickerControllerEditedImage] forState:UIControlStateNormal];
        }
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    for (NSInteger i=0; i<6; ++i)
    {
        UIButton *imageBtn = _imageList[i];
        if (imageBtn.selected) {
            if ((i+1) < 6) {
                if ((i + 1) == 3) {
                    self.uploadImageViewH.constant = 186;
                }
                ((UIButton *)_imageList[i+1]).hidden = NO;
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

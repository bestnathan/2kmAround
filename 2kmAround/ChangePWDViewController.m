
#import "Headers.h"


#import "ChangePWDViewController.h"
#define kWidth self.view.frame.size.width
#define kHeight  self.view.frame.size.height
@interface ChangePWDViewController ()

@end

@implementation ChangePWDViewController

-(void)p_setupViews{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"change.jpg"]]];
    
    self.nameLabel = [[UILabel alloc]init];
    self.emailLabel = [[UILabel alloc]init];
    self.pwdLabel = [[UILabel alloc]init];
    
    CGRect rect1 = CGRectMake(5, 44, 80, 40);
    CGRect rect2 = CGRectMake(5, CGRectGetMaxY(rect1)+10, 80, 40);
    CGRect rect3 = CGRectMake(5, CGRectGetMaxY(rect2)+10, 80, 40);
    
    self.nameLabel.backgroundColor = [UIColor grayColor];
    self.emailLabel.backgroundColor = [UIColor grayColor];
    self.pwdLabel.backgroundColor = [UIColor grayColor];
    
    
    
    [self.nameLabel.layer setMasksToBounds:YES];
    self.nameLabel.layer.cornerRadius = 10.0;
    
    self.nameLabel.backgroundColor =[UIColor colorWithRed:0.9 green:0.5 blue:0.1 alpha:0.6];
    
    
    [self.emailLabel.layer setMasksToBounds:YES];
    self.emailLabel.layer.cornerRadius = 10.0;
    
    self.emailLabel.backgroundColor =[UIColor colorWithRed:0.9 green:0.5 blue:0.1 alpha:0.6];
    
    
    [self.pwdLabel.layer setMasksToBounds:YES];
    self.pwdLabel.layer.cornerRadius = 10.0;
    
    self.pwdLabel.backgroundColor =[UIColor colorWithRed:0.9 green:0.5 blue:0.1 alpha:0.6];
    
    self.nameLabel.frame = rect1;
    self.emailLabel.frame=rect2;
    self.pwdLabel.frame=rect3;
    
    self.nameLabel.text=@"旧密码:";
    self.nameLabel.textAlignment= NSTextAlignmentCenter;
    self.emailLabel.text=@"新密码:";
    self.emailLabel.textAlignment= NSTextAlignmentCenter;
    self.pwdLabel.text=@"再次确认:";
    
    self.pwdLabel.textAlignment= NSTextAlignmentCenter;
    
    
    self.nameTF = [[UITextField alloc]init];
    self.emailTF = [[UITextField alloc]init];
    self.pwdTF = [[UITextField alloc]init];
    //self.nameTF.backgroundColor = [UIColor blueColor];
    //self.emailTF.backgroundColor = [UIColor blueColor];
    //self.pwdTF.backgroundColor = [UIColor blueColor];
    
    
    
    
    self.emailTF.backgroundColor =[UIColor colorWithRed:0.9 green:0.5 blue:0.1 alpha:0.6];
    self.emailTF.layer.cornerRadius = 10.0;
    
    
    
    self.nameTF.backgroundColor =[UIColor colorWithRed:0.9 green:0.5 blue:0.1 alpha:0.6];
    self.nameTF.layer.cornerRadius = 10.0;
    
    
    self.pwdTF.backgroundColor =[UIColor colorWithRed:0.9 green:0.5 blue:0.1 alpha:0.6];
    self.pwdTF.layer.cornerRadius = 10.0;
    
    
    CGRect rect4 = CGRectMake(CGRectGetMaxX(rect1)+2, CGRectGetMinY(rect1), kWidth-89, 40);
    CGRect rect5 = CGRectMake(CGRectGetMaxX(rect2)+2, CGRectGetMinY(rect2), kWidth-89, 40);
    CGRect rect6 = CGRectMake(CGRectGetMaxX(rect3)+2, CGRectGetMinY(rect3), kWidth-89, 40);
    
    self.nameTF.frame=rect4;
    //self.nameTF.backgroundColor=[UIColor orangeColor];
    self.emailTF.frame=rect5;
    
    //self.emailTF.backgroundColor=[UIColor orangeColor];
    self.pwdTF.frame=rect6;
    [self.pwdTF setSecureTextEntry:YES];//设置为密码输入
    
   // self.pwdTF.backgroundColor=[UIColor orangeColor];
    
    
    self.registerButton =[UIButton buttonWithType:UIButtonTypeCustom];
   // self.registerButton.backgroundColor = [UIColor grayColor];
     self.registerButton.backgroundColor =[UIColor colorWithRed:0.2 green:0.5 blue:0.5 alpha:0.6];
    self.backButton =[UIButton buttonWithType:UIButtonTypeCustom];
    //self.backButton.backgroundColor = [UIColor grayColor];
     self.backButton.backgroundColor =[UIColor colorWithRed:0.2 green:0.5 blue:0.5 alpha:0.6];
    
    CGRect rect7 = CGRectMake(CGRectGetMinX(rect1), CGRectGetMaxY(rect3)+10, kWidth-10, 40);
    CGRect rect8 = CGRectMake(CGRectGetMinX(rect1), CGRectGetMaxY(rect7)+10, kWidth-10, 40);
    
    self.registerButton.frame = rect7;
    self.backButton.frame=rect8;
    
    
    [self.registerButton setTitle:@"更改密码" forState:UIControlStateNormal];
    
    [self.registerButton.layer setMasksToBounds:YES];
    
    [self.registerButton.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    [self.registerButton.layer setBorderWidth:1.0]; //边框宽度
    
    [self.backButton setTitle:@"返回" forState:UIControlStateNormal];
    
    [self.backButton.layer setMasksToBounds:YES];
    
    [self.backButton.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    [self.backButton.layer setBorderWidth:1.0]; //边框宽度
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.emailLabel];
    [self.view addSubview:self.pwdLabel];
    
    
    [self.view addSubview:self.nameTF];
    [self.view addSubview:self.emailTF];
    [self.view addSubview:self.pwdTF];
    
    [self.view addSubview:self.registerButton];
    
    [self.view addSubview:self.backButton];
    
    
    [self.registerButton addTarget:self action:@selector(registerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark button点击事件
-(void) registerButtonAction:(UIButton*)sender{
    NSLog(@"点击注册按钮");
    
    
    //判断不为空
    
    if((![self.nameTF.text isEqual:@""])&&(![self.emailTF.text isEqual:@""])&&(![self.pwdTF.text isEqual:@""]))
    {
       
        
        
        if ([self.emailTF.text isEqualToString:self.pwdTF.text]) {
            //两次输入的密码一致
            
            
            [AVUser logInWithUsernameInBackground:[AVUser currentUser].username password:self.nameTF.text block:^(AVUser *user, NSError *error) {
                if(!error){
                    
                   [[AVUser currentUser] updatePassword:self.nameTF.text newPassword:self.pwdTF.text block:^(id object, NSError *error) {
                       
                       if (!error) {
                             [[AVUser currentUser] refresh];
                           [self clearTF];
                           [self showHUDText:@"更改密码成功！"];
                         

                       }else {
                           [self showHUDText:@"更改密码失败！"];

                       }
                       
                       
                   }];
                    
                    
                    
                    
                    
                    
                    
                }else {
                    
                    [self showHUDText:[NSString stringWithFormat:@"旧密码不正确%@",error]];
                }
            }];
            
        }else{
            [self showHUDText:@"两次输入的新密码不一致！"];

        }
        
        
        
        
        
        
        
        
        
        
       
        
        
    }
    else{
        
        
        [self showHUDText:@"信息不完整！"];
    }
    
    
    
    
}
-(void) backButtonAction:(UIButton*)sender{
    NSLog(@"点击返回按钮");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self p_setupViews];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showHUDText:(NSString*)text  {
    MBProgressHUD* hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //    hud.labelText=text;
    hud.detailsLabelFont = [UIFont systemFontOfSize:14];
    hud.detailsLabelText = text;
    hud.margin=10.f;
    hud.removeFromSuperViewOnHide=YES;
    hud.mode=MBProgressHUDModeText;
    [hud hide:YES afterDelay:2];
    
}
-(void)clearTF{
    self.nameTF.text=nil;
    self.emailTF.text=nil;
    self.pwdTF.text=nil;
}

@end

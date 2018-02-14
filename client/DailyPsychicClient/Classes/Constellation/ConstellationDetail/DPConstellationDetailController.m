//
//  DPConstellationDetailController.m
//  DailyPsychicClient
//
//  Created by lsy on 2018/1/31.
//  Copyright © 2018年 h. All rights reserved.
//

#import "DPConstellationDetailController.h"
#import "DPConstellationDetailView.h"
#import "DPPalmResultController.h"
#import "DPSelectConstellationController.h"
#import "DPConstellationModel.h"
#import "DPTakePhotoController.h"
#import "DPTestListController.h"
#import "DPUserProtocolController.h"


@class DPSelectConstellationController;

@interface DPConstellationDetailController ()<AFBaseTableViewDelegate,DPConstellationDetailDelegate>
{
    DPConstellationDetailView *m_pConstellDetail;
}
@end

@implementation DPConstellationDetailController


- (void)viewDidLoad {
    [super viewDidLoad];
    m_pConstellDetail = [[DPConstellationDetailView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    m_pConstellDetail.proDelegate = self;
    m_pConstellDetail.conDetailDel = self;
    [self.view addSubview:m_pConstellDetail];
    
    //NOTICE
    UIButton *pNotice = [UIButton buttonWithType:UIButtonTypeCustom];
    [pNotice addTarget:self action:@selector(Notice:) forControlEvents:UIControlEventTouchUpInside];
    [pNotice setTitle:@"NOTICE" forState:0];
    pNotice.titleLabel.font = [UIFont fontWithName:[TextManager RegularFont] size:15];
    pNotice.titleLabel.textColor = [UIColor whiteColor];
    pNotice.bounds = CGRectMake(0, 0, 100 * AdaptRate, 44);
    pNotice.center = CGPointMake(self.view.width - pNotice.width * 0.5, NAVIGATION_BAR_Y + pNotice.height * 0.5);
    [self.view addSubview:pNotice];

}

- (void)PopPreviousPage{

    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)PushToNextPage:(id)argData{
    
    NSInteger btnTag = [argData integerValue];
    switch (btnTag) {
        case 100:
        {
            BOOL isbuy = [mUserDefaults boolForKey:@"isbuy"];
            if (isbuy) {
                DPPalmResultController *resultVc = [[DPPalmResultController alloc]init];
                resultVc.dpResultType = DPResultConstellation;
                [self PushChildViewController:resultVc animated:YES];
            }
            else
            {
                DPUserProtocolController *pVC = [[DPUserProtocolController alloc]init];
                [self PushChildViewController:pVC animated:YES];
            }
        }
            break;
        case 101:
        {
            DPTestListController *pVC = [[DPTestListController alloc]init];
            [self PushChildViewController:pVC animated:YES];
        }
            break;
        case 102:
        {
            DPTakePhotoController *pVC = [[DPTakePhotoController alloc]init];
            [self PushChildViewController:pVC animated:YES];
        }
            break;
        default:
            break;
    }
   
}
- (void)PresentToselect{
    
    DPSelectConstellationController * selectVc = [[DPSelectConstellationController alloc]init];
    selectVc.isPresent = YES;
    [self presentViewController:selectVc animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)Notice:(UIButton *)button
{
    DPUserProtocolController *pVC = [[DPUserProtocolController alloc]init];
    pVC.notice = @"notice";
    [self PushChildViewController:pVC animated:YES];
}
@end

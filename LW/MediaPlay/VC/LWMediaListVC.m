//
//  LWMediaListVC.m
//  LW
//
//  Created by joymake on 16/7/4.
//  Copyright © 2016年 joymake. All rights reserved.
//

#import "LWMediaListVC.h"
#import "LWMediaInteractor.h"
#import "LWMediaPresenter.h"
#import "LWTableAutoLayoutView.h"
#import "UISegementView.h"
#import <WebKit/WebKit.h>

@interface LWMediaListVC ()
@property (nonatomic,strong)LWTableAutoLayoutView *mediaListView;
@property (nonatomic,strong)UISegementView *segmentView;
@property (nonatomic,strong)LWMediaInteractor *interactor;
@property (nonatomic,strong)LWMediaPresenter *presenter;
@property (nonatomic,strong)WKWebView *webView;
@end

@implementation LWMediaListVC
-(UISegementView *)segmentView{
    if (!_segmentView) {
        _segmentView = [[UISegementView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 40)];
        _segmentView.segmentItems = @[@"影视",@"新闻",@"娱乐"];
        _segmentView.selectColor = [UIColor purpleColor];
        _segmentView.deselectColor = [UIColor lightGrayColor];
    }
    return _segmentView;
}

-(WKWebView *)webView{
    return _webView = _webView?:[[WKWebView alloc]init];
}

-(LWTableAutoLayoutView *)mediaListView{
    _mediaListView = _mediaListView?:[[LWTableAutoLayoutView alloc]init];
    _mediaListView.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _mediaListView.tableView.tableHeaderView = self.segmentView;
    return _mediaListView;
}

-(LWMediaInteractor *)interactor{
    return _interactor = _interactor?:[[LWMediaInteractor alloc]init];
}

-(LWMediaPresenter *)presenter{
    if (!_presenter) {
        _presenter = [[LWMediaPresenter alloc]initWithView:self.view];
        _presenter.segmentView = self.segmentView;
        _presenter.mediaListView = self.mediaListView;
        _presenter.webView = self.webView;
        _presenter.interactor = self.interactor;
    }
    return _presenter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaultConstraintWithView:self.mediaListView andTitle:@"休闲"];
    [self.view addSubview:self.webView];
    [self.presenter reloadDataSource];
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    __weak __typeof (&*self)weakSelf = self;
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.view.mas_leading);
        make.top.equalTo(weakSelf.view.mas_top).offset(40);
        make.trailing.equalTo(weakSelf.view.mas_trailing);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
    [self.webView setNeedsUpdateConstraints];
}

@end
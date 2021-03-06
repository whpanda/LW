//
//  LWMediaPresenter.h
//  LW
//
//  Created by joymake on 2016/10/26.
//  Copyright © 2016年 joymake. All rights reserved.
//

#import "JoyPresenterBase.h"
@class LWMediaInteractor,JoyTableAutoLayoutView,JoyUISegementView;

@interface LWMediaPresenter : JoyPresenterBase
@property (nonatomic,strong)LWMediaInteractor *interactor;
@property (nonatomic,strong)JoyTableAutoLayoutView *mediaListView;
@property (nonatomic,strong)JoyUISegementView *segmentView;

@end

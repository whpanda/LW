//
//  LWColorTableInteracter.h
//  LW
//
//  Created by Joymake on 2016/11/9.
//  Copyright © 2016年 joymake. All rights reserved.
//

#import "JoyInteractorBase.h"

@interface LWColorTableInteracter : JoyInteractorBase
@property (nonatomic,strong)NSMutableArray *dataArrayM;

- (void)getViewDataSource;
@end

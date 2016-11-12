//
//  SaveContactViewProtocol.h
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

@protocol SaveContactViewProtocolDelegate <NSObject>
@required
- (void)showSuccesMessage;
- (void)showErrorMessage;
- (void)showInvalidInfoMessage;
@optional
- (void)clearView;
@end

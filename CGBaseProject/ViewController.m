//
//  ViewController.m
//  CGBaseProject
//
//  Created by chrise on 2018/3/15.
//  Copyright © 2018年 chrise. All rights reserved.
//

#import "ViewController.h"


#import "SwitchHeader.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *resultImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
#pragma mark 拼接数据第一种
- (IBAction)firstBtnClick:(UIButton *)sender {
    //前期准备--获取一张图片的大小
    NSString  *path=  [[NSBundle mainBundle] pathForResource:@"ceshi" ofType:@"jpeg"];
    NSData* content = [NSData dataWithContentsOfFile:path];
    int value = (int)content.length;
    
    //开始转换为4个字节
    Byte byteData[4] = {};
    
    byteData[0] =(Byte)((value & 0xFF000000)>>24);
    
    byteData[1] =(Byte)((value & 0x00FF0000)>>16);
    
    byteData[2] =(Byte)((value & 0x0000FF00)>>8);
    
    byteData[3] =(Byte)((value & 0x000000FF));
    //转换为4个字节
    
    //开始拼接
    Byte byte[] = {0x80,0x9B,byteData[0],byteData[1],byteData[2],byteData[3]};
    //转为NSData
    NSData *temphead = [[NSData alloc]initWithBytes:byte length:6];
    
    //拼接content
    NSMutableData *m_data = [[NSMutableData alloc] init];
    [m_data appendData:temphead];
    [m_data appendData:content];
    
    [self readData:m_data];
    
    //输出
    NSLog(@"byteData:%hhu%hhu%hhu%hhu", byteData[0], byteData[1], byteData[2], byteData[3]);
    NSLog(@"byte[]:%s", byte);
    NSLog(@"temphead:%@", temphead);
   
    NSLog(@"m_data:%@", m_data);
}
#pragma mark 拼接数据第二种
- (IBAction)secondBtnClick:(UIButton *)sender {
    //前期准备
    NSString  *path=  [[NSBundle mainBundle] pathForResource:@"ceshi" ofType:@"jpeg"];
    NSData* content = [NSData dataWithContentsOfFile:path];
    int value = (int)content.length;
    
    //将长度转为十进制string
    NSString* decimalString = [NSString stringWithFormat:@"%d",value];
    //将十进制string转为十六进制并保证长度为8
    NSString* firstHex = [decimalString decimalToHexWithLength:8];
    //将十六进制拼接上809B
    NSString* hexString = [NSString stringWithFormat:@"809B%@",firstHex];
    //将十六进制转为NSData
    NSData* temphead = [hexString convertBytesStringToData];
    
    //拼接content
    NSMutableData *m_data = [[NSMutableData alloc] init];
    [m_data appendData:temphead];
    [m_data appendData:content];
    
    [self readData:m_data];
    
 
    //输出
    NSLog(@"decimalString:%@", decimalString);
    NSLog(@"firstHex:%@", firstHex);
    NSLog(@"hexString:%@", hexString);
    NSLog(@"temphead:%@", temphead);
    NSLog(@"m_data:%@", m_data);
}

#pragma mark 解析数据
-(void)readData:(NSData*)_receiveData{
    //1 获取头部数据
    NSData *head = [_receiveData subdataWithRange:NSMakeRange(0, 6)];//取得头部数据
    NSData *lengthData = [head subdataWithRange:NSMakeRange(2, 4)];//取得长度数据
    //2 将4个字节的数据还原为content的长度
    //2.1 将lengthData转为16进制数
    NSString* hexString = [lengthData convertDataToHexStr];
    //2.2 将16进制数转为10进制
    NSInteger length = [[hexString hexToDecimal]integerValue];//得出内容长度
    
    NSInteger complateDataLength = length + 6;//算出一个包完整的长度(内容长度＋头长度)
    if (_receiveData.length >= complateDataLength)//如果缓存中数据够一个整包的长度
    {
        NSData *data = [_receiveData subdataWithRange:NSMakeRange(6, length)];//截取一个包的长度(处理粘包)
        
        [self.resultImage setImage:[UIImage imageWithData:data]];
    }
    
}
#pragma mark 清除图片
- (IBAction)clearImage:(UIButton *)sender {
    
    [self.resultImage setImage:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

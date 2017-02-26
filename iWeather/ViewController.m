//
//  ViewController.m
//  iWeather
//
//  Created by Sonic Spec on 2/26/17.
//  Copyright © 2017 Sonic Spec. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;

@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *c_f;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photofiles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ",@"Có công mài sắt có ngày nên kim",@"Chớ thấy sóng cả mà ngã tay chèo",@"Không có gì quý hơn độc lập tự do",@"Đi một ngày đàng học một sàng khôn"];
    locations = @[@"Berlin, Duc",@"BecLin, Trung Quoc",@"Lasvegas, American",@"Hanoi, Vietnam"];
    photofiles = @[@"rain",@"thunder",@"sunny",@"windy"];
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform((uint)quotes.count);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform((uint)locations.count);
    self.location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform((uint)photofiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photofiles[photoIndex]];
    
    NSString* string = [NSString stringWithFormat:@"%2.1f",[self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
}
- (IBAction)btnTemperature:(id)sender {
    if ( [self.c_f.text  isEqual: @"C"] ){
        self.c_f.text = @"F";
        float temp_f =self.temperature.currentTitle.floatValue + 273;
        NSString* f = [NSString stringWithFormat:@"%.1f",temp_f];
        [self.temperature setTitle:f forState:UIControlStateNormal];
        NSLog(@"%@",f);
    } else {
        self.c_f.text = @"C";
        float temp_c =self.temperature.currentTitle.floatValue - 273;
        NSString* c = [NSString stringWithFormat:@"%.1f",temp_c];
        [self.temperature setTitle:c forState:UIControlStateNormal];
        NSLog(@"%@",c);
    }
}
-(float)getTemperature{
    if ( [self.c_f.text  isEqual: @"C"] ){
        return 14.0 + arc4random_uniform(18) + (float)arc4random() / (float) INT32_MAX;
    } else {
        return 287.0 + arc4random_uniform(18) + (float)arc4random() / (float) INT32_MAX;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

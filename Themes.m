#import "Themes.h"

NSString *intToText(int percent) {
    NSArray *small = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten",
                     @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen"];
    NSArray *large = @[@"", @"", @"twenty", @"thirty", @"forty", @"fifteen", @"sixty", @"seventy", @"eighty", @"ninety"];

    if (percent < 20) {
        return small[percent];
    } else if (percent < 100) {
        if (percent % 10 == 0) {
            return large[percent / 10];
        }
        NSMutableString *text = [NSMutableString stringWithString:large[percent / 10]];
        [text appendString:@"-"];
        [text appendString:small[percent % 10]];
        return text;
    } else {
        return @"one-hundred";
    }
};

NSString *intToRoman(int percent) {
    NSArray *symbols = @[@"C", @"XC", @"L", @"XL", @"X", @"IX", @"V", @"IV", @"I"];
    NSArray *values = @[@100, @90, @50, @40, @10, @9, @5, @4, @1];

    NSMutableString *roman = [NSMutableString string];

    for (int i = 0; i < values.count; i++) {
        while (percent >= [values[i] intValue]) {
            [roman appendString:symbols[i]];
            percent -= [values[i] intValue];
        }
    }

    return roman;
};

NSString *intToBin(int percent) {
    NSMutableString *binString = [NSMutableString stringWithString:@"0b"];
    BOOL foundStart = NO;

    for (int i = sizeof(percent) * 8 - 1; i >= 0; i--) {
        if (percent & (1 << i)) {
            foundStart = YES;
            [binString appendString:@"1"];
        } else if (foundStart || i == 0) {
            [binString appendString:@"0"];
        }
    }

    return binString;
};

NSString *intToHex(int percent) {
    return [NSString stringWithFormat:@"0x%X", percent];
};

NSString* intToOctal(int percent) {
    return [NSString stringWithFormat:@"0o%o", percent];
};

NSString *removePercent(int percent) {
    return [NSString stringWithFormat:@"%d", percent];
};

NSString *noTheme(int percent) {
    NSMutableString *text = [NSMutableString stringWithString:removePercent(percent)];
    [text appendString:@"%"];
    return text;
};

NSArray<NSValue *> *themes;

__attribute__((constructor))
static void initializeThemes() {
    themes = @[
        [NSValue valueWithPointer:&noTheme],
        [NSValue valueWithPointer:&removePercent],
        [NSValue valueWithPointer:&intToText],
        [NSValue valueWithPointer:&intToRoman],
        [NSValue valueWithPointer:&intToHex],
        [NSValue valueWithPointer:&intToBin],
        [NSValue valueWithPointer:&intToOctal]
    ];
}
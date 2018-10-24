//
//  PdfViewController.m
//  iosApp
//
//  Created by Elzes on 25.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "PdfViewController.h"

@interface PdfViewController ()

@end

@implementation PdfViewController

@synthesize  _mytext = mytext,
             _mytitle = mytitle,
             _pdfButton = pdfButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mytitle = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, 350, 40)];
    mytitle.placeholder = @"Your title";
    mytitle.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:mytitle];
   
    mytext = [[UITextView alloc]initWithFrame:CGRectMake(30, 80, 350, 500)];    self._mytext.layer.borderWidth = 1.0f;
    self._mytext.layer.cornerRadius = 8;
    self._mytext.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.view addSubview:mytext];
    
    pdfButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 600, 200, 40)];
    pdfButton.layer.cornerRadius = 8;
    pdfButton.clipsToBounds = YES;
    [pdfButton setTitle:@"Create my PDF" forState:UIControlStateNormal];
    pdfButton.backgroundColor = [UIColor grayColor];
    [pdfButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pdfButton addTarget:self action:@selector(createPdf:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pdfButton];
    
}

-(void)createPdf:(id)sender{
/*  If u store Document Directory on xcode  */

NSArray * dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

//Define path for PDF file
NSString * documentPath = [[dirPath objectAtIndex:0] stringByAppendingPathComponent:@"file.pdf"];

// Prepare the text using a Core Text Framesetter.
CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, (__bridge CFStringRef)mytext.text, NULL);
if (currentText) {
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
    
    if (framesetter) {
        // Create the PDF context using the default page size of 612 x 792.
        UIGraphicsBeginPDFContextToFile(documentPath, CGRectZero, nil);
        
        CFRange currentRange = CFRangeMake(0, 0);
        int currentPage = 0;
        BOOL done = NO;
        
        do {
            // Mark the beginning of a new page.
            UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
            
            // Draw a page number at the bottom of each page.
            currentPage++;
            [self drawPageNbr:currentPage];
            
            // Render the current page and update the current range to
            // point to the beginning of the next page.
            currentRange = *[self updatePDFPage:currentPage setTextRange:&currentRange setFramesetter:&framesetter];
            
            // If we're at the end of the text, exit the loop.
            if (currentRange.location == CFAttributedStringGetLength((CFAttributedStringRef)currentText))
                done = YES;
        } while (!done);
        
        // Close the PDF context and write the contents out.
        UIGraphicsEndPDFContext();
        
        // Release the framewetter.
        CFRelease(framesetter);
        
    } else {
        NSLog(@"Could not create the framesetter..");
    }
    // Release the attributed string.
    CFRelease(currentText);
} else {
    NSLog(@"currentText could not be created");
}
}

- (void)drawPageNbr:(NSInteger)pageNum
{
    NSString *pageString = [NSString stringWithFormat:@"Page %ld", (long)pageNum];
    UIFont *theFont = [UIFont systemFontOfSize:12];
    CGSize maxSize = CGSizeMake(612, 72);
    
    CGRect stringRect = CGRectMake(((612.0 - maxSize.width) / 2.0),
                                   720.0 + ((72.0 - maxSize.height) / 2.0),
                                   maxSize.width,
                                   maxSize.height);
    
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          theFont, NSFontAttributeName,
                                          [UIColor blackColor], NSForegroundColorAttributeName,
                                          nil];
    [pageString drawInRect:stringRect withAttributes:attributesDictionary];
}


-(CFRange*)updatePDFPage:(int)pageNumber setTextRange:(CFRange*)pageRange setFramesetter:(CTFramesetterRef*)framesetter
{
    // Get the graphics context.
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    // Create a path object to enclose the text. Use 72 point
    // margins all around the text.
    CGRect frameRect = CGRectMake(72, 72, 468, 648);
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    // Get the frame that will do the rendering.
    // The currentRange variable specifies only the starting point. The framesetter
    // lays out as much text as will fit into the frame.
    CTFrameRef frameRef = CTFramesetterCreateFrame(*framesetter, *pageRange,
                                                   framePath, NULL);
    CGPathRelease(framePath);
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, 792);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    // Draw the frame.
    CTFrameDraw(frameRef, currentContext);
    // Update the current range based on what was drawn.
    *pageRange = CTFrameGetVisibleStringRange(frameRef);
    pageRange->location += pageRange->length;
    pageRange->length = 0;
    CFRelease(frameRef);
    return pageRange;
}

    
@end

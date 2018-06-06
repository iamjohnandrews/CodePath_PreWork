package com.example.andrj148.hackerrankunit1;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class FirstExam extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_first_exam);
    }

    int lettersChangeToMakeAnagramFrom(NSArray ) {
        int arraySize = [array count];
        // from examples, seems like array must be even
        if (arraySize % 2 != 0) {
            NSLog(@"return -1");
            return -1;
        }
        int midPoint = arraySize / 2;
        NSArray* leftArray = [array subarrayWithRange:(NSMakeRange(0, midPoint))];

        int letterChanges = 0;
        for (int i = midPoint; i < arraySize; i++) {
            if (![leftArray containsObject: array[i]]) {
                letterChanges++;
            }
        }
        NSLog(@"%d", letterChanges);
        return letterChanges;
    }
}

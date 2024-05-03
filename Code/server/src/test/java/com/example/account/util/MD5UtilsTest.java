package com.example.account.util;

import com.example.account.utils.MD5Utils;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class MD5UtilsTest {

    @Test
    public void testEncoderByMd5() {
        String input = "hello world";
        String expectedOutput = "XrY7u+Ae7tCTyyK7j1rNww==";

        String actualOutput = MD5Utils.EncoderByMd5(input);
        assertEquals(expectedOutput, actualOutput);
    }

    @Test
    public void testEncoderByMd5WithEmptyString() {
        String input = "";
        String expectedOutput = "1B2M2Y8AsgTpgAmY7PhCfg==";

        String actualOutput = MD5Utils.EncoderByMd5(input);
        assertEquals(expectedOutput, actualOutput);
    }

    @Test
    public void testEncoderByMd5WithNull() {
        assertThrows(IllegalArgumentException.class, () -> {
            MD5Utils.EncoderByMd5(null);
        });
    }

    @Test
    public void testEncoderByMd5WithDifferentCases() {
        String input1 = "Hello World";
        String input2 = "hello world";
        String expectedOutput1 = "sQqNsWTgdUEFt6mb5y4/5Q==";

        String actualOutput1 = MD5Utils.EncoderByMd5(input1);
        String actualOutput2 = MD5Utils.EncoderByMd5(input2);

        assertEquals(expectedOutput1, actualOutput1);
        assertEquals("XrY7u+Ae7tCTyyK7j1rNww==", actualOutput2);
    }
}

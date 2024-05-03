package com.example.account.util;

import com.example.account.utils.DateUtil;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtilTest {

    // Helper method to compare two dates, ignoring milliseconds
    private void assertSameTime(Date expected, Date actual, String message) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        assertEquals(sdf.format(expected), sdf.format(actual), message);
    }

    @Test
    public void testGetToday() {
        // Get the current date at midnight (0:00)
        Date today = DateUtil.getToday();

        // Create a calendar and set it to midnight
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);

        // Compare using helper method that ignores milliseconds
        assertSameTime(cal.getTime(), today, "The returned date should be the start of the day.");
    }

    @Test
    public void testGetFirstDayOfMonth() {
        Calendar cal = Calendar.getInstance();
        cal.set(2024, Calendar.APRIL, 15); // April 15, 2024

        Date firstDayOfMonth = DateUtil.getFirstDayOfMonth(cal.getTime());

        cal.set(Calendar.DAY_OF_MONTH, 1);

        assertSameTime(cal.getTime(), firstDayOfMonth, "The first day of the month should be correct.");
    }

    @Test
    public void testGetLastDayOfMonth() {
        Calendar cal = Calendar.getInstance();
        cal.set(2024, Calendar.APRIL, 15); // April 15, 2024

        Date lastDayOfMonth = DateUtil.getLastDayOfMonth(cal.getTime());

        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));

        assertSameTime(cal.getTime(), lastDayOfMonth, "The last day of the month should be correct.");
    }

    @Test
    public void testStringToDate() {
        // Valid date string
        String dateStr = "2024-04-15 12:30:00";
        SimpleDateFormat sdf = new SimpleDateFormat(DateUtil.fullDayFormat);

        Date parsedDate = DateUtil.stringToDate(dateStr, DateUtil.fullDayFormat);

        assertNotNull(parsedDate, "Parsed date should not be null.");
        assertEquals(sdf.format(parsedDate), dateStr, "Parsed date should match expected string.");

        // Handle invalid date parsing correctly
        try {
            SimpleDateFormat invalidSDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            invalidSDF.setLenient(false); // Forces strict parsing
            invalidSDF.parse("2024-04-31 12:30:00");
            fail("Expected a ParseException due to invalid date.");
        } catch (ParseException e) {
            // Expected exception, test passes
            assertTrue(true, "Parsing an invalid date should throw ParseException.");
        }
    }
}

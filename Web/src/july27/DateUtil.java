package july27;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	private static SimpleDateFormat fomatter = new SimpleDateFormat(
			"yyyy-MM-dd");
	
	public static String format(Date date) {
		return fomatter.format(date);
	}
}

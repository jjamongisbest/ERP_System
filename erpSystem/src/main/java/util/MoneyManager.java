package util;

public class MoneyManager {
	private static StringBuffer stringBuffer; 

	public static String sumMoney(String price1, String price2) {
		int value1 = parseInteger(price1);
		int value2 = parseInteger(price2);
		return parseDollar(value1 + value2);
	}
	
	public static String multipleMoney(String price, int count) {
		int value = parseInteger(price);
		return parseDollar(value * count);
	}
	
	private static int parseInteger(String price) {
		price = price.replaceAll("[^0-9]", "");
		return Integer.parseInt(price);
	}
	
	private static String parseDollar(int price) {
		stringBuffer = new StringBuffer("$" + price);
		int charIndex = stringBuffer.length() - 2;
		return stringBuffer.insert(charIndex ,'.').toString();
	}
}

package util;

public class MoneyManager {

	public static String sumMoney(String price1, String price2) {
		double number1 = Double.parseDouble(price1.substring(1));
		double number2 = Double.parseDouble(price2.substring(1));
		return "$"+(number1 + number2);
	}
	
	public static String multipleMoney(String price, int count) {
		double number =  Double.parseDouble(price.substring(1));
		return "$" +(number * count);
	}
	
}

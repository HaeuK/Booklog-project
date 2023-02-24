package com.utils;

public class Util {

	/**
	 * 문자열이 <code>null</code>이 아니고 길이가 1이상인 경우 true를 리턴한다.
	 * @Date	: 2013. 2. 3.
	 * @param str
	 * @return
	 */
	public static boolean hasLength(CharSequence str) {
		return str != null && str.length() > 0;
	}

	/**
	 * 문자열이 <code>null</code>이 아니고 길이가 1이상인 경우 true를 리턴한다.
	 * @Date	: 2013. 2. 3.
	 * @param str
	 * @return
	 */
	public static boolean hasLength(String str) {
		return hasLength(((CharSequence) (str)));
	}
	
	/**
	 * 문자열이 존재하는지 여부를 돌려준다. <code>null</code>이거나 빈문자열은 false를 리턴한다.
	 * @param str
	 * @return
	 */
	public static boolean hasText(CharSequence str) {
		if (!hasLength(str))
			return false;
		int strLen = str.length();
		for (int i = 0; i < strLen; i++)
			if (!Character.isWhitespace(str.charAt(i)))
				return true;

		return false;
	}
	
	/**
	 * 문자열이 존재하는지 여부를 돌려준다. <code>null</code>이거나 빈문자열은 false를 리턴한다.
	 * @param str
	 * @return
	 */
	public static boolean isNotBlank(CharSequence str) {
		return hasText(str);
	}
}

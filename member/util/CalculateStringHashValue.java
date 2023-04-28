package iSpan.animalplanet.member.util;

public class CalculateStringHashValue {

	public static void main(String[] args) {
		System.out.println("計算字串的MD5, SHA1與SHA512的Hash值");
		String s1 = "我是密碼";
		System.out.println("MD5 ->" + CipherUtils.getStringMD5(s1));
		System.out.println("SHA1->" + CipherUtils.getStringSHA1(s1));
		System.out.println("SHA256->" + CipherUtils.getStringSHA256(s1));
		System.out.println("SHA384->" + CipherUtils.getStringSHA384(s1));
		System.out.println("SHA512->" + CipherUtils.getStringSHA512(s1));
		
		System.out.println("----------------------------------------------");
		
		String s2 = "我是亂碼";
		System.out.println("MD5 ->" + CipherUtils.getStringMD5(s2));
		System.out.println("SHA1->" + CipherUtils.getStringSHA1(s2));
		System.out.println("SHA256->" + CipherUtils.getStringSHA256(s2));
		System.out.println("SHA384->" + CipherUtils.getStringSHA384(s2));
		System.out.println("SHA512->" + CipherUtils.getStringSHA512(s2));

	}
}

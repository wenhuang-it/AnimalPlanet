package iSpan.animalplanet.member.security;

import org.springframework.security.core.AuthenticationException;

public class LoginFailedException extends AuthenticationException{



	public LoginFailedException(String message) {
		super(message);

	}

}

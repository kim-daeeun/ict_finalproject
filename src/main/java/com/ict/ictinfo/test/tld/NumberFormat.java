package com.ict.ictinfo.test.tld;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.SkipPageException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class NumberFormat extends SimpleTagSupport {

	private String format;
	private String number;

	public void setFormat(String format) {
		this.format = format;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	@Override
	public void doTag() throws JspException, IOException {
		System.out.println("input Number :" + number);
		System.out.println("input Format :" + format);

		try {	
			//포맷팅할 숫자
			double amount = Double.parseDouble(number);

			//포맷 형식( EX. #,###.00 )
			DecimalFormat formatter = new DecimalFormat(format);
			String formattedNumber = formatter.format(amount);			

			//출력
			getJspContext().getOut().write(formattedNumber);			

		} catch (Exception e) {
			e.printStackTrace();
			throw new SkipPageException("Exception formatting " + number + " format " + format);
		}
	}
}


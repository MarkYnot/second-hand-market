package cn.second_hand;

import org.junit.Test;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class LoginTester {
	@Given("^user navigates to login.jsp page$")
	public void navigatePage() {
	System.out.println("Cucumber executed Given statement");
	}
	

	@When("^user logs in using Username as \"(.*)\" and Password \"(.*)\"$")
	public void login(String usename,String password) {
	System.out.println("Username is:"+ usename);
	System.out.println("Password is:"+ password);
	}

	@When("^click the Submit button$")
	public void clickTheSubmitButton() {
	System.out.println("Executing When statement");
	}

	@Then("^Home page should be displayed$")
	public void validatePage() {
	System.out.println("Executing Then statement");
	}
	
	@Then("^login should be successful$")
	public void validateLoginSuccess() {
	System.out.println("Executing 2<sup>nd</sup> Then statement");
	}
}

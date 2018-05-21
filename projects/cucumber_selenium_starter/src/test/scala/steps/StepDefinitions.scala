package steps

import cucumber.api.DataTable
import cucumber.api.scala.{EN, ScalaDsl}
import org.scalatest._
import support.Browser

import collection.JavaConverters._

class StepDefinitions extends ScalaDsl with EN with Matchers with Browser {

  Given("""^I am on the social care compliance homepage$"""){() =>
    go to "http://localhost:8550/apply-for-social-care-compliance-scheme/capacity-registering"
    find(cssSelector("h1")).get.text shouldBe "Which of these options best describes you?"
  }

  When("""^I choose the "(.+)" option$"""){option: String =>

    option match {
      case "Someone who pays for care directly" =>
        click on id("capacityRegistering.personalBudgetHolderDirect")
      case "An agent or representative of someone who pays for care directly" =>
        click on id("capacityRegistering.personalBudgetHolderAgent")
      case "Yes" =>
        click on id("value-yes")
      case "No" =>
        click on id("value-no")
    }
  }

  And("""^I click continue"""){() =>
    click on id("submit")
  }

  When("""^I enter my full name$"""){ () =>

      textField("value").value = "Bob Dole"
  }

  When("""^I enter my client's full name$"""){ () =>
      textField("value").value = "Mary Sue"
  }

  When("""^I enter the address as$"""){ table: DataTable =>
    table.asMaps[String, String](classOf[String], classOf[String]).asScala.foreach(row => {
      textField(row.get("Field")).value = row.get("Value")
    })
  }

  When("""^I enter my telephone number$"""){ () =>
    textField("value").value = "07123456789"
  }

  When("""^I enter their telephone number$"""){ () =>
    textField("value").value = "01912359876"
  }

  Then("""^I will be asked (.+)$""") { path: String =>
    path match {
      case "if my address is in the UK" =>
        find(cssSelector("h1")).get.text shouldBe "Is your address in the UK?"

      case "if their address is in the UK" =>
        find(cssSelector("h1")).get.text shouldBe "Is the address of the person who pays for care in the UK?"

      case "for my full name" =>
        find(cssSelector("h1")).get.text shouldBe "What is your full name?"

      case "for my client's full name" =>
        find(cssSelector("h1")).get.text shouldBe "What is the full name of the person who pays for care?"

      case "for my address" =>
        find(cssSelector("h1")).get.text shouldBe "What is your address?"

      case "for my client's address" =>
        find(cssSelector("h1")).get.text shouldBe "What is the address of the person who pays for care?"

      case "for my telephone number" =>
        find(cssSelector("h1")).get.text shouldBe "What is your telephone number?"

      case "for my client's telephone number" =>
        find(cssSelector("h1")).get.text shouldBe "What is the telephone number of the person who pays for care?"

      case "if I have an email address" =>
        find(cssSelector("h1")).get.text shouldBe "Do you have an email address we can contact you on?"

      case "if I have a UTR" =>
        find(cssSelector("h1")).get.text shouldBe "Do you have a Unique Taxpayer Reference (UTR) number?"

      case "if they have a UTR" =>
        find(cssSelector("h1")).get.text shouldBe "Does the person who pays for care have a Unique Taxpayer Reference (UTR) number?"

      case "if I have a PAYE reference number" =>
        find(cssSelector("h1")).get.text shouldBe "Do you have a Pay As You Earn (PAYE) reference number?"

      case "if they have a PAYE reference number" =>
        find(cssSelector("h1")).get.text shouldBe "Does the person who pays for care have a Pay As You Earn (PAYE) reference number?"

      case "to check my answers" =>
        find(cssSelector("h1")).get.text shouldBe "Check your answers before sending your application"

      case "if my client has an email address" =>
        find(cssSelector("h1")).get.text shouldBe "Does the person who pays for care have an email address we can contact them on?"
    }
  }

  Then("""^my application will be sent$"""){ () =>
    find(cssSelector("h1")).get.text shouldBe "Application received"
  }

  When("""^I check my answers they should be$"""){ table: DataTable =>
    table.asMaps[String, String](classOf[String], classOf[String]).asScala.foreach(row => {
      find(className("tabular_data__entry")).foreach(e =>
        if(e.text contains row.get("Label")) e.text should include(row.get("Answer"))
      )
    })
  }

}